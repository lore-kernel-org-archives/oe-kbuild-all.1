Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 114346BFC0
	for <oe-kbuild-all@lists.linux.dev>; Tue, 13 Aug 2024 08:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723536012; cv=none; b=k2RrYzUVM2fkIay6wgrqeVrZBWjRodXbmIfKsYdyU2mOHlgA7nNDDZ5hzOsoAYnhNq6CoWxm8Bt9c+tWEgzF6UU9ZtSGwDYBMiSOsGeqi8lzibXAVjXmS4ff1GA8V0CL2J/1u3+AdP3OYmeqc4v4HnTy6IwW/OzphLG9J9wCcCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723536012; c=relaxed/simple;
	bh=ZZNMazY+wB0Qt5QH+bRB/+v1cqkYb6cJ6wHaTsf9QZM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HDUkqndFcoVUAzloOuiq5Oatyuux+ZQre2cg13i5Hj+7K3O/muoCIxqr8apa60GBkXFkVYmpf7kFet4Odh/nOtjFmhMwzP1Zu6cT/XWZfAfzZhqFeQj1VPH6KXxrU4II7onjFvazgMAgl9FZHuQWi3hD7H249cPRDY8d/ZY7gWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SN5lESIB; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SN5lESIB"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5ba43b433beso5466399a12.1
        for <oe-kbuild-all@lists.linux.dev>; Tue, 13 Aug 2024 01:00:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723536009; x=1724140809; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8B4aF2RhoJ87Q6+bPsf2aPZNzfoieuHNYR9HqWY5+FU=;
        b=SN5lESIBuXPYuj0tu3X1hC83Hds0PBeQa9rp0eU+TdlbHn0ci8LwKFtvjuxnZvLYEm
         Em8xSulWEb04ztiELRdOFtOzKevHOLTGgCB/+TdIkhOC3Y/RNgIvVj2i+aEWNMAGrU0f
         DkS8XHCiXwHjUlyHXFJmQXFLV+9qmPiQUr4GLyR3GoLeOpD56zVAQRtW0p2XtDtn4jNY
         Bu/ABJIFKKiR/EjpONtFA8yzdneZl8wSNmCfP0W12c2cq5fmVLq/iM/FnILnHcz6YLtE
         g1ZRHT0AnvtncC4IkIKXN8zwyk7CkyZOuGJhHj0FYxFLhbxHKBreS+NLemLL6LNokP8I
         j2eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723536009; x=1724140809;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8B4aF2RhoJ87Q6+bPsf2aPZNzfoieuHNYR9HqWY5+FU=;
        b=srTyF1Sx2NgBymwSmvB7UI+U+it/4Aub2IBVLN3aVKiy+i+eKyU5Y/9SuZJ7/y2xUR
         X7sPfwFcsXqwL5nqu0MGHE0R5KKIwhMTfcNJkmLGxMhiFoWDN1S1MAuLQgd+l1j9b26E
         VxNKIRJAkdeO3dg+Rd/haiBzmxAvAgK5vWLwjPB6qAdJZJpj7Id12RfYi58OFmfZ2AQW
         1o4WdBPTyGCpTXHhXBMQgew3KZ2IXEj98jTwmy+ai7kvoGbv4HCS8OtZA/tp6/IWIKS+
         4HBa9wSAAwsFCH7kZ9ScxAlW6IVhdKK9CDQ26SNq2fLUJ8/AfB2bmhqQ5nsWZmLpAPQh
         8C8A==
X-Forwarded-Encrypted: i=1; AJvYcCXRjllrQTUTCHXHQ4O08cFOKsVwRGtarlo0aAC2RxIEvb3FuP1QE8WsyBFsfW/J7o36RTV0IVuPjvA5e/lkzRLJPwaK9Z1ItbUbZlH11Q==
X-Gm-Message-State: AOJu0Yw1yp+bqWfrfIUNz90BXbiBRmJhzXQBDTDCoc2wN35Snlrtip9S
	f/lII38JhXDBf7V7bCuKHxaicxCqALyudLagUq57CDf/c2rnEIqrizDb2LjDij4=
X-Google-Smtp-Source: AGHT+IGIsBAmGDvIqzFfs21L+bkNCMbqJN/sGhkWBbxSO2GOwb7z5+wSnD75VLe0Bjg2n+z2W30cIA==
X-Received: by 2002:a05:6402:3587:b0:5bb:9ae0:4a46 with SMTP id 4fb4d7f45d1cf-5bd44c0cff8mr2369154a12.5.1723536009102;
        Tue, 13 Aug 2024 01:00:09 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5bd187f29d0sm2733183a12.2.2024.08.13.01.00.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Aug 2024 01:00:08 -0700 (PDT)
Date: Tue, 13 Aug 2024 11:00:04 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Al Viro <viro@zeniv.linux.org.uk>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-fsdevel@vger.kernel.org
Subject: [viro-vfs:work.fdtable 13/13] kernel/fork.c:3242 unshare_fd() warn:
 passing a valid pointer to 'PTR_ERR'
Message-ID: <020d5bd0-2fae-481f-bc82-88e71de1137c@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs.git work.fdtable
head:   3f4b0acefd818ec43b68455994ac2bd5166c06ae
commit: 3f4b0acefd818ec43b68455994ac2bd5166c06ae [13/13] dup_fd(): change calling conventions
config: x86_64-randconfig-161-20240813 (https://download.01.org/0day-ci/archive/20240813/202408130945.I8wIAYBm-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202408130945.I8wIAYBm-lkp@intel.com/

smatch warnings:
kernel/fork.c:3242 unshare_fd() warn: passing a valid pointer to 'PTR_ERR'

vim +/PTR_ERR +3242 kernel/fork.c

60997c3d45d9a6 Christian Brauner 2020-06-03  3232  int unshare_fd(unsigned long unshare_flags, unsigned int max_fds,
60997c3d45d9a6 Christian Brauner 2020-06-03  3233  	       struct files_struct **new_fdp)
cf2e340f4249b7 JANAK DESAI       2006-02-07  3234  {
cf2e340f4249b7 JANAK DESAI       2006-02-07  3235  	struct files_struct *fd = current->files;
cf2e340f4249b7 JANAK DESAI       2006-02-07  3236  
cf2e340f4249b7 JANAK DESAI       2006-02-07  3237  	if ((unshare_flags & CLONE_FILES) &&
a016f3389c0660 JANAK DESAI       2006-02-07  3238  	    (fd && atomic_read(&fd->count) > 1)) {
3f4b0acefd818e Al Viro           2024-08-06  3239  		*new_fdp = dup_fd(fd, max_fds);
3f4b0acefd818e Al Viro           2024-08-06  3240  		if (IS_ERR(*new_fdp)) {
3f4b0acefd818e Al Viro           2024-08-06  3241  			*new_fdp = NULL;
3f4b0acefd818e Al Viro           2024-08-06 @3242  			return PTR_ERR(new_fdp);
                                                                               ^^^^^^^^^^^^^^^^
	err = PTR_ERR(*new_fdp);
	*new_fdp = NULL;
	return err;

3f4b0acefd818e Al Viro           2024-08-06  3243  		}
a016f3389c0660 JANAK DESAI       2006-02-07  3244  	}
cf2e340f4249b7 JANAK DESAI       2006-02-07  3245  
cf2e340f4249b7 JANAK DESAI       2006-02-07  3246  	return 0;
cf2e340f4249b7 JANAK DESAI       2006-02-07  3247  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

