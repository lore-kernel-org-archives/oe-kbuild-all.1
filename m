Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B4EF1D79A9
	for <oe-kbuild-all@lists.linux.dev>; Mon,  6 Jan 2025 10:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736160423; cv=none; b=UlEu74wFb/4vyMFu/d/D789LXSI2aprQQ3rTgA6Dha9PGn6CKT+vXzJk/ZdG9DpuGrm3Tur93BdSOxDQHVlXAnpGqdvyqNZjjKmgkZxmDmb/BWKXmiv1XAMwBz7lDHFDRe7gSAYWvQBbQkUFUFYwvcd+Q5Bf0yMPU8H29Wn00YI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736160423; c=relaxed/simple;
	bh=nazTvwWi+a+lsHff76x4X3YAnRPHpoZFKdk1LWxPsps=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KNJ/fYv7GyriTLsdSaplm9MNILAx+V1iaLDt+x3WYk7r1RqJFqAJLUQFDN3iF2eV64Y1/WWzHXK3RrbNqlh7vn7nR/XK0Z4+KWdAvjgSQRnuUh9AoeALJ6D7Os3kDs8a9/B8P45h+rVpxITypt+kDmSfp3NIFmqB0rIRyT3StFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=F3RgOPRf; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="F3RgOPRf"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43690d4605dso60958195e9.0
        for <oe-kbuild-all@lists.linux.dev>; Mon, 06 Jan 2025 02:47:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736160420; x=1736765220; darn=lists.linux.dev;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=97Bf1CSq9adKj+BIA6+dBNDqKS2E+xJOqITqq/f1HT4=;
        b=F3RgOPRf+d3uuVZrmkgStX/0q6DSme3vTT12JddX8Khn+Pr0NoHcmZhgG7m82MPHWD
         XtWWBCEHdZ00P69gW/VVjK8MFrWMKqniHSgwovVWIaiv86xsFvaHfRHa/iMO4RBZecYL
         jS9qlZVqXPC4tas3NGUc3niz7LmJapqqCu3jnO1pNXrhoCjHjUpASw01rLZLDKeX9CrY
         MOdpbKQN8ZlqZq4CVhnHrLTNnOk/dBLDefWWgt/e50ENQa6R6b7ZLHx8SAWIp9IwbB+c
         dNy7aK7M0DmN5LEipJj8sNsWQ6yKBnTdKkEfyab/4D3RnYtuR8Zsh/CSm/FJ8BXBtd42
         3vVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736160420; x=1736765220;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=97Bf1CSq9adKj+BIA6+dBNDqKS2E+xJOqITqq/f1HT4=;
        b=OQTzaUNF8AQ+7SGiSBnnehXlJd6E6eLXnAK+vnBy75fYyM1XIdtfhFIT7/IfGhP+Vx
         830y+bxITltxwKWXQ/jdcHGjLNiALUd2Qm8ST0DHdBi6viEovx/UsXzDOB58GZ8e4vGT
         gkAHXruRjK6tQELd0QnniWXr6aICwiLfsLvvB+ZI5x8fxZlysmHQqe9n8fPvpAOC/GeR
         PWVm5zr7MbeZcpI/GdwA97H5ZyGLyb1gDMUuTu7PGxJ9EXnvYmjWjxl/d+1Du+FWiQ8Y
         DTcwWFGrPktP78V45HJA8Szu98j411742OLWHi3lDBZZpxrrolm97PnJY2bx1xEEMtBe
         +mcQ==
X-Forwarded-Encrypted: i=1; AJvYcCXx+B5U6vp0V0DXCxtFOEZ8ttBP0/ByTzA1TH4w6txEWQU2NLoqCaUo6EaH0emijFdvVW9pK7MUN864QwS1@lists.linux.dev
X-Gm-Message-State: AOJu0Yw86/9/YkEUwOgnIb7vhPjf9zi1mKzbpQYjNtukHOVzFSDedjxL
	Frz48ekC4kw/ZEoYQKjQlE3GJFPmkICRExr5eT3ejX+ksNgmNfGyYG/qAVie86Q=
X-Gm-Gg: ASbGnctEwgQh1Tex48UJf7Y3wbdd3Si/RMIIWCqD9dkm/UmA7pBjIBZdOy2nslUHiKD
	s4LDYacrBWkkOXVgS6Nd+iqsvETHpzy5fQRaveZeKw5ZZ/hk7O6k+iEc/rZH0dLtCiXx2iLH9Ae
	4VCsBk3Yc8az+9Zmlzn5LMh9mm0xaTj5l1RB+aprknrdRXnOkoyV/9OKq1vbAdheCGUY11D9W2j
	gm5yldQpk+8PhROgwo8nemGWRjae+qI20JXb3EJPjRPVYsRpj1AdTriUzxB9A==
X-Google-Smtp-Source: AGHT+IGhPB/GefcMNOWk9+TPbKYHLvj8ruwAbCvuMnvMApBFIbyaUHjMWEKqGnhdse6XyBg/eUmKIg==
X-Received: by 2002:a05:600c:5129:b0:434:a04f:2557 with SMTP id 5b1f17b1804b1-4366854830cmr479325815e9.4.1736160419769;
        Mon, 06 Jan 2025 02:46:59 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43664b15365sm549913795e9.7.2025.01.06.02.46.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 02:46:59 -0800 (PST)
Date: Mon, 6 Jan 2025 13:46:56 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [pali:cifs 20/48] fs/smb/client/cifsacl.c:1514 set_cifs_acl() error:
 uninitialized symbol 'access_flags'.
Message-ID: <8e2d1d8e-5830-4342-b646-ccf025d2c508@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pali/linux.git cifs
head:   cc26137de51202e7210b058f6696393f1e006d46
commit: ce9f9c0511bbb913daa982afed5859ab68adf0e8 [20/48] cifs: Fix getting and setting SACLs over SMB1
config: riscv-randconfig-r072-20241228 (https://download.01.org/0day-ci/archive/20241228/202412281410.msF9yv6K-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202412281410.msF9yv6K-lkp@intel.com/

smatch warnings:
fs/smb/client/cifsacl.c:1514 set_cifs_acl() error: uninitialized symbol 'access_flags'.

vim +/access_flags +1514 fs/smb/client/cifsacl.c

3651487607ae77 fs/smb/client/cifsacl.c ChenXiaoSong       2024-08-22  1486  int set_cifs_acl(struct smb_ntsd *pnntsd, __u32 acllen,
a5ff376966c079 fs/cifs/cifsacl.c       Shirish Pargaonkar 2011-10-13  1487  			struct inode *inode, const char *path, int aclflag)
b96d31a62f7145 fs/cifs/cifsacl.c       Christoph Hellwig  2009-05-27  1488  {
b96d31a62f7145 fs/cifs/cifsacl.c       Christoph Hellwig  2009-05-27  1489  	int oplock = 0;
6d5786a34d98bf fs/cifs/cifsacl.c       Pavel Shilovsky    2012-06-20  1490  	unsigned int xid;
0f060936e490c6 fs/cifs/cifsacl.c       Amir Goldstein     2020-02-03  1491  	int rc, access_flags;
96daf2b09178d8 fs/cifs/cifsacl.c       Steve French       2011-05-27  1492  	struct cifs_tcon *tcon;
a5ff376966c079 fs/cifs/cifsacl.c       Shirish Pargaonkar 2011-10-13  1493  	struct cifs_sb_info *cifs_sb = CIFS_SB(inode->i_sb);
7ffec372458d16 fs/cifs/cifsacl.c       Jeff Layton        2010-09-29  1494  	struct tcon_link *tlink = cifs_sb_tlink(cifs_sb);
d81b8a40e2ece0 fs/cifs/cifsacl.c       Pavel Shilovsky    2014-01-16  1495  	struct cifs_fid fid;
d81b8a40e2ece0 fs/cifs/cifsacl.c       Pavel Shilovsky    2014-01-16  1496  	struct cifs_open_parms oparms;
7ffec372458d16 fs/cifs/cifsacl.c       Jeff Layton        2010-09-29  1497  
7ffec372458d16 fs/cifs/cifsacl.c       Jeff Layton        2010-09-29  1498  	if (IS_ERR(tlink))
7ffec372458d16 fs/cifs/cifsacl.c       Jeff Layton        2010-09-29  1499  		return PTR_ERR(tlink);
97837582bc1e19 fs/cifs/cifsacl.c       Steve French       2007-12-31  1500  
7ffec372458d16 fs/cifs/cifsacl.c       Jeff Layton        2010-09-29  1501  	tcon = tlink_tcon(tlink);
6d5786a34d98bf fs/cifs/cifsacl.c       Pavel Shilovsky    2012-06-20  1502  	xid = get_xid();
97837582bc1e19 fs/cifs/cifsacl.c       Steve French       2007-12-31  1503  
ce9f9c0511bbb9 fs/smb/client/cifsacl.c Pali Rohár         2024-10-14  1504  	if (aclflag & CIFS_ACL_OWNER || aclflag & CIFS_ACL_GROUP)
ce9f9c0511bbb9 fs/smb/client/cifsacl.c Pali Rohár         2024-10-14  1505  		access_flags |= WRITE_OWNER;
ce9f9c0511bbb9 fs/smb/client/cifsacl.c Pali Rohár         2024-10-14  1506  	if (aclflag & CIFS_ACL_SACL)
ce9f9c0511bbb9 fs/smb/client/cifsacl.c Pali Rohár         2024-10-14  1507  		access_flags |= SYSTEM_SECURITY;
ce9f9c0511bbb9 fs/smb/client/cifsacl.c Pali Rohár         2024-10-14  1508  	if (aclflag & CIFS_ACL_DACL)
ce9f9c0511bbb9 fs/smb/client/cifsacl.c Pali Rohár         2024-10-14  1509  		access_flags |= WRITE_DAC;

What if the permisions are 000?

a5ff376966c079 fs/cifs/cifsacl.c       Shirish Pargaonkar 2011-10-13  1510  
de036dcaca65cf fs/cifs/cifsacl.c       Volker Lendecke    2023-01-11  1511  	oparms = (struct cifs_open_parms) {
de036dcaca65cf fs/cifs/cifsacl.c       Volker Lendecke    2023-01-11  1512  		.tcon = tcon,
de036dcaca65cf fs/cifs/cifsacl.c       Volker Lendecke    2023-01-11  1513  		.cifs_sb = cifs_sb,
de036dcaca65cf fs/cifs/cifsacl.c       Volker Lendecke    2023-01-11 @1514  		.desired_access = access_flags,
                                                                                                          ^^^^^^^^^^^^
warning

de036dcaca65cf fs/cifs/cifsacl.c       Volker Lendecke    2023-01-11  1515  		.create_options = cifs_create_options(cifs_sb, 0),
de036dcaca65cf fs/cifs/cifsacl.c       Volker Lendecke    2023-01-11  1516  		.disposition = FILE_OPEN,
de036dcaca65cf fs/cifs/cifsacl.c       Volker Lendecke    2023-01-11  1517  		.path = path,
de036dcaca65cf fs/cifs/cifsacl.c       Volker Lendecke    2023-01-11  1518  		.fid = &fid,

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

