function rt = MatchedFilter(st)
    % MatchedFilter - Description
    % ƥ���˲�����
    % 
    % Syntax: rt = MatchedFilter(st)
    %
    % st Ҫƥ���˲����ź�
    % rt ƥ���˲���Ľ��
    % ht ƥ���˲���ϵͳ����
    ht = st(end:-1:1); 
    rt = conv(st, ht);
end
