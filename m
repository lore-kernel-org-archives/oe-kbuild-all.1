Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93D791B81D3
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Nov 2025 11:33:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763551995; cv=none; b=n6d3tpOpZFmgZdxsFR4OcuPnCJ3bJIdGSjB9q/tKYJ6XJ1feIyeacaOakOxFs+sEn2zUxIAlHx4Yd+FUmXzel0FDDqtNO7pC48nUzUnyMxzJyxlAqramlXeTKGOm/qF9jdvqSja1+/uCj26cp9vnrR/XJ2p3qtJux/2e2dX/qVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763551995; c=relaxed/simple;
	bh=rEKHxiloOov11vR4ysdFapqx9+lo4NRYZaAhZDWi6RM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SiEYUKVyt/YT2CtcvxLK8acyVF3ePcm5M9izxtQtB3p4z7zVrvoRHN8ePp8I1NdK1BNf31QhqNYDb/9RARNioYkUuSdVo/ysvnSxNtJb+TTLyIcAwPar506O/13Mo/Bvu7zjkXJob03v5jD4bIg6yLELn30YF1HEulPSIJcYHls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NzshNIpp; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NzshNIpp"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b736ffc531fso881583666b.1
        for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Nov 2025 03:33:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763551992; x=1764156792; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AsBMIyY0Yp0x0Bid5eEV0tzC+f87jStvL72KKEcvouo=;
        b=NzshNIppwHECpFLdtoVv8CDOhrK8NaxqI4suQCi68av4mEzZKW8RshNm8bY0tHITdF
         Hf7asVmGrdLfulcjRgtM/L3SOFOlcowIrac9Fq8W+Qb2QTcstU8H804VnQ9ine3uoRSD
         ZVARjcoEobpgyE9ZGvVlAfpdUJjY1qLd31De00zgHsy3QqPffMiGozwvNmT9dtShFlHL
         SwgWAzFC0+u1Grqv1bbQKdaMdZa7TAstP2gTcOj6e3Q/l00JeiBctn+cQmqMlc5FepiF
         IaNpQHZBKLQvBgZ/tKqZWmTfMIfcdXAmPsHK4GDtgeA5Y6SJ9mtsS7L9wNcqmi9R4/xY
         di+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763551992; x=1764156792;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AsBMIyY0Yp0x0Bid5eEV0tzC+f87jStvL72KKEcvouo=;
        b=D7Y0e4Xa4J3TFVp8VkAmoQx0WxDaUg7gNYbu7yCxVrSAVQxkwTHxCPGXLEi4ez2uTA
         fJ/xD7WuCISl1Ge1lEqx8+F8misF1+mBc2MmwqeVx5yvEOdMJu1RvhFDjnKzLoMpTJw1
         RQ0FbJaiQFLnE3Vttvfwy6oX9sY5X0CNoXPqG2tn7NqDlftf1GApDLCd7BmdQ0JOw110
         3U+oLqhSCb5IjHzbNDDsOi5eSv/CVBVCLvajJL61CckvHnKR8b5EKAgR1jeboygGDqH3
         sNHmNGcspe35COskE8ZSjmFvdGyUKLGPi1rSWC+Zb0/YE2gFRnKlqjEf/l0eGHxvkgyH
         64Fw==
X-Forwarded-Encrypted: i=1; AJvYcCXxv4+sbrGRbcVy7DjGgjvp8mmIHTHe7pTkBkU9zm3SZjctIZoxDyjHihuGEmPQP9JzzBdrjVcqUUTvK3+P@lists.linux.dev
X-Gm-Message-State: AOJu0Yytr7wisfOB9pXLSlxHxEEOtlS7/Lmul36+oY02rC/EX4hwz4Jw
	WpfBq0PRMX0BbQ3EOQVNr7EW4FwUtVPFYw5DW0lw1z0eLoV2z4PiO1j27HwHSaAq5lQ=
X-Gm-Gg: ASbGncszPKHN8WunnZDr/AA1frovB7ScscxtHwPugx5w/zhjQltkJw3aRGaRNr5m38v
	+k2bnvpE5noMu2SKbP3RsqHYMUc2yOMS+hXxkR4Pt4vx5f+nSaG8hMMa7ZifymzyBJ62Mvs+RAx
	X1K7elTFnPjh9kjIg2tzDX2ACTB88YuBnkuDsg9PQjsZ+yW5BgNC4FgA410ch/XbUE6a7PlJXnO
	MXYgeYRi7C+MpCHqhQ3ePhgyy9PfWJIEX4y8aWJqFUPGliKEfFhxatOCzphVl24+5/BnDbc2r8G
	YWDXy7QkvlEghfLAP9ubzaWYXBXw4YldwI/UTwZka2b8ONFtore0mg3gW+mt2k74KWr5Ful8LqF
	f37SLDcGbx7DBRvNOFieR4oUUDcdq5HX32BjNzWmOZ+RokcVO3aIlPBZWiTceOg3On+VLsnxkM9
	bMH3y5ZrvYvFTajrVzqZHEiJYlgms=
X-Google-Smtp-Source: AGHT+IHtBfMJ71j5rAneYV9ERR1pGzs6y/BegtRlJtceqQt9QRH6bSuJtNPqXVsi0pGHXwmqg6BKgw==
X-Received: by 2002:a17:906:794d:b0:b73:870f:fa2b with SMTP id a640c23a62f3a-b76378bb2a9mr254097266b.27.1763551991708;
        Wed, 19 Nov 2025 03:33:11 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b734fad4487sm1640563666b.22.2025.11.19.03.33.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 03:33:11 -0800 (PST)
Date: Wed, 19 Nov 2025 14:33:07 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Christian Brauner <brauner@kernel.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Christian Brauner <christianvanbrauner@gmail.com>
Subject: [brauner-github:work.fd.prepare 31/43] fs/namespace.c:4376
 __do_sys_fsmount() error: uninitialized symbol 'file'.
Message-ID: <202511190607.2Y9PvVQN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/brauner/linux.git work.fd.prepare
head:   7eb06f9f7a76175a82d3c6b9d94219d7b64b6bce
commit: 7a6aae3e938ed79442f55c1f2b6d4a73a2cf0c51 [31/43] fs: namespace
config: powerpc-randconfig-r072-20251119 (https://download.01.org/0day-ci/archive/20251119/202511190607.2Y9PvVQN-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202511190607.2Y9PvVQN-lkp@intel.com/

New smatch warnings:
fs/namespace.c:4376 __do_sys_fsmount() error: uninitialized symbol 'file'.

vim +/file +4376 fs/namespace.c

93766fbd2696c2 David Howells     2018-11-01  4276  SYSCALL_DEFINE3(fsmount, int, fs_fd, unsigned int, flags,
93766fbd2696c2 David Howells     2018-11-01  4277  		unsigned int, attr_flags)
93766fbd2696c2 David Howells     2018-11-01  4278  {
93766fbd2696c2 David Howells     2018-11-01  4279  	struct mnt_namespace *ns;
93766fbd2696c2 David Howells     2018-11-01  4280  	struct fs_context *fc;
93766fbd2696c2 David Howells     2018-11-01  4281  	struct file *file;
7a6aae3e938ed7 Christian Brauner 2025-11-18  4282  	struct path newmount __free(path_put) = {};
93766fbd2696c2 David Howells     2018-11-01  4283  	struct mount *mnt;
93766fbd2696c2 David Howells     2018-11-01  4284  	unsigned int mnt_flags = 0;
93766fbd2696c2 David Howells     2018-11-01  4285  	long ret;
93766fbd2696c2 David Howells     2018-11-01  4286  
93766fbd2696c2 David Howells     2018-11-01  4287  	if (!may_mount())
93766fbd2696c2 David Howells     2018-11-01  4288  		return -EPERM;
93766fbd2696c2 David Howells     2018-11-01  4289  
93766fbd2696c2 David Howells     2018-11-01  4290  	if ((flags & ~(FSMOUNT_CLOEXEC)) != 0)
93766fbd2696c2 David Howells     2018-11-01  4291  		return -EINVAL;
93766fbd2696c2 David Howells     2018-11-01  4292  
5b490500f91b21 Christian Brauner 2021-01-21  4293  	if (attr_flags & ~FSMOUNT_VALID_FLAGS)
93766fbd2696c2 David Howells     2018-11-01  4294  		return -EINVAL;
93766fbd2696c2 David Howells     2018-11-01  4295  
5b490500f91b21 Christian Brauner 2021-01-21  4296  	mnt_flags = attr_flags_to_mnt_flags(attr_flags);
93766fbd2696c2 David Howells     2018-11-01  4297  
93766fbd2696c2 David Howells     2018-11-01  4298  	switch (attr_flags & MOUNT_ATTR__ATIME) {
93766fbd2696c2 David Howells     2018-11-01  4299  	case MOUNT_ATTR_STRICTATIME:
93766fbd2696c2 David Howells     2018-11-01  4300  		break;
93766fbd2696c2 David Howells     2018-11-01  4301  	case MOUNT_ATTR_NOATIME:
93766fbd2696c2 David Howells     2018-11-01  4302  		mnt_flags |= MNT_NOATIME;
93766fbd2696c2 David Howells     2018-11-01  4303  		break;
93766fbd2696c2 David Howells     2018-11-01  4304  	case MOUNT_ATTR_RELATIME:
93766fbd2696c2 David Howells     2018-11-01  4305  		mnt_flags |= MNT_RELATIME;
93766fbd2696c2 David Howells     2018-11-01  4306  		break;
93766fbd2696c2 David Howells     2018-11-01  4307  	default:
93766fbd2696c2 David Howells     2018-11-01  4308  		return -EINVAL;
93766fbd2696c2 David Howells     2018-11-01  4309  	}
93766fbd2696c2 David Howells     2018-11-01  4310  
8152f820108835 Al Viro           2024-07-19  4311  	CLASS(fd, f)(fs_fd);
8152f820108835 Al Viro           2024-07-19  4312  	if (fd_empty(f))
93766fbd2696c2 David Howells     2018-11-01  4313  		return -EBADF;
93766fbd2696c2 David Howells     2018-11-01  4314  
1da91ea87aefe2 Al Viro           2024-05-31  4315  	if (fd_file(f)->f_op != &fscontext_fops)
8152f820108835 Al Viro           2024-07-19  4316  		return -EINVAL;
93766fbd2696c2 David Howells     2018-11-01  4317  
1da91ea87aefe2 Al Viro           2024-05-31  4318  	fc = fd_file(f)->private_data;
93766fbd2696c2 David Howells     2018-11-01  4319  
7a6aae3e938ed7 Christian Brauner 2025-11-18  4320  	ACQUIRE(mutex_intr, uapi_mutex)(&fc->uapi_mutex);
7a6aae3e938ed7 Christian Brauner 2025-11-18  4321  	ret = ACQUIRE_ERR(mutex_intr, &uapi_mutex);
7a6aae3e938ed7 Christian Brauner 2025-11-18  4322  	if (ret)
8152f820108835 Al Viro           2024-07-19  4323  		return ret;
93766fbd2696c2 David Howells     2018-11-01  4324  
93766fbd2696c2 David Howells     2018-11-01  4325  	/* There must be a valid superblock or we can't mount it */
93766fbd2696c2 David Howells     2018-11-01  4326  	ret = -EINVAL;
93766fbd2696c2 David Howells     2018-11-01  4327  	if (!fc->root)
7a6aae3e938ed7 Christian Brauner 2025-11-18  4328  		return ret;
93766fbd2696c2 David Howells     2018-11-01  4329  
93766fbd2696c2 David Howells     2018-11-01  4330  	ret = -EPERM;
93766fbd2696c2 David Howells     2018-11-01  4331  	if (mount_too_revealing(fc->root->d_sb, &mnt_flags)) {
807602d8cfc8b6 Aleksa Sarai      2025-08-06  4332  		errorfcp(fc, "VFS", "Mount too revealing");
7a6aae3e938ed7 Christian Brauner 2025-11-18  4333  		return ret;
93766fbd2696c2 David Howells     2018-11-01  4334  	}
93766fbd2696c2 David Howells     2018-11-01  4335  
93766fbd2696c2 David Howells     2018-11-01  4336  	ret = -EBUSY;
93766fbd2696c2 David Howells     2018-11-01  4337  	if (fc->phase != FS_CONTEXT_AWAITING_MOUNT)
7a6aae3e938ed7 Christian Brauner 2025-11-18  4338  		return ret;
93766fbd2696c2 David Howells     2018-11-01  4339  
f7e33bdbd6d1bd Jeff Layton       2021-08-19  4340  	if (fc->sb_flags & SB_MANDLOCK)
f7e33bdbd6d1bd Jeff Layton       2021-08-19  4341  		warn_mandlock();
93766fbd2696c2 David Howells     2018-11-01  4342  
93766fbd2696c2 David Howells     2018-11-01  4343  	newmount.mnt = vfs_create_mount(fc);
7a6aae3e938ed7 Christian Brauner 2025-11-18  4344  	if (IS_ERR(newmount.mnt))
7a6aae3e938ed7 Christian Brauner 2025-11-18  4345  		return PTR_ERR(newmount.mnt);
93766fbd2696c2 David Howells     2018-11-01  4346  	newmount.dentry = dget(fc->root);
93766fbd2696c2 David Howells     2018-11-01  4347  	newmount.mnt->mnt_flags = mnt_flags;
93766fbd2696c2 David Howells     2018-11-01  4348  
93766fbd2696c2 David Howells     2018-11-01  4349  	/* We've done the mount bit - now move the file context into more or
93766fbd2696c2 David Howells     2018-11-01  4350  	 * less the same state as if we'd done an fspick().  We don't want to
93766fbd2696c2 David Howells     2018-11-01  4351  	 * do any memory allocation or anything like that at this point as we
93766fbd2696c2 David Howells     2018-11-01  4352  	 * don't want to have to handle any errors incurred.
93766fbd2696c2 David Howells     2018-11-01  4353  	 */
93766fbd2696c2 David Howells     2018-11-01  4354  	vfs_clean_context(fc);
93766fbd2696c2 David Howells     2018-11-01  4355  
93766fbd2696c2 David Howells     2018-11-01  4356  	ns = alloc_mnt_ns(current->nsproxy->mnt_ns->user_ns, true);
7a6aae3e938ed7 Christian Brauner 2025-11-18  4357  	if (IS_ERR(ns))
7a6aae3e938ed7 Christian Brauner 2025-11-18  4358  		return PTR_ERR(ns);
93766fbd2696c2 David Howells     2018-11-01  4359  	mnt = real_mount(newmount.mnt);
93766fbd2696c2 David Howells     2018-11-01  4360  	ns->root = mnt;
2eea9ce4310d8c Miklos Szeredi    2023-10-25  4361  	ns->nr_mounts = 1;
2eea9ce4310d8c Miklos Szeredi    2023-10-25  4362  	mnt_add_to_ns(ns, mnt);
1b0b9cc8d3793e Eric Biggers      2019-06-12  4363  	mntget(newmount.mnt);
93766fbd2696c2 David Howells     2018-11-01  4364  
7a6aae3e938ed7 Christian Brauner 2025-11-18  4365  	FD_PREPARE(fdprep, (flags & FSMOUNT_CLOEXEC) ? O_CLOEXEC : 0,
7a6aae3e938ed7 Christian Brauner 2025-11-18  4366  		   dentry_open(&newmount, O_PATH, fc->cred));
7a6aae3e938ed7 Christian Brauner 2025-11-18  4367  	if (fd_prepare_failed(fdprep)) {
93766fbd2696c2 David Howells     2018-11-01  4368  		dissolve_on_fput(newmount.mnt);
7a6aae3e938ed7 Christian Brauner 2025-11-18  4369  		return fd_prepare_error(fdprep);
93766fbd2696c2 David Howells     2018-11-01  4370  	}
93766fbd2696c2 David Howells     2018-11-01  4371  
7a6aae3e938ed7 Christian Brauner 2025-11-18  4372  	/*
7a6aae3e938ed7 Christian Brauner 2025-11-18  4373  	 * Attach to an apparent O_PATH fd with a note that we
7a6aae3e938ed7 Christian Brauner 2025-11-18  4374  	 * need to unmount it, not just simply put it.
7a6aae3e938ed7 Christian Brauner 2025-11-18  4375  	 */
7a6aae3e938ed7 Christian Brauner 2025-11-18 @4376  	file->f_mode |= FMODE_NEED_UNMOUNT;
                                                        ^^^^^^^^^^^^
Was part of the commit missing? file is uninitialized.

7a6aae3e938ed7 Christian Brauner 2025-11-18  4377  	return fd_publish(fdprep);
93766fbd2696c2 David Howells     2018-11-01  4378  }
93766fbd2696c2 David Howells     2018-11-01  4379  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

