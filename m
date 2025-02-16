Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F14E1F94C
	for <oe-kbuild-all@lists.linux.dev>; Sun, 16 Feb 2025 15:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739720673; cv=none; b=oyV+u0RcD6gZ6+xlLMI2iMpuc4/d7uSeLH1Z2vdbsSstHAgcc76gi+cJ6ymX9gZNQyiTCgpd1YUMDxGM8NivgPBUr7jo2EV/Z96ncObCD1M9Kg9i6uCPU7sQYTKnbIgup+c5eAtuCSdDyYx+7ZX9I88PoPXTA7ClPCuuV1rD074=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739720673; c=relaxed/simple;
	bh=VJ55JkBRfouBFn8M95NvDf49JtUpPr21iyatArf8blk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Uy31CtT+UFEK/7Zy+jGABx1K8Lc/q2O5QX28NaS8pv0yudXJbze6X7ltYyek4Tx3fW4hJW/BdoTZHasn3D/QF2GSYWkz/yth94bcHrEJV3CZDNiWCpAipBhL67cfh9/NqYwU/c3+4JtOlSPi64aGFiLzNeCvOnEpfrhuIdW9iyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=x7hoOdPG; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="x7hoOdPG"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5ded46f323fso4324035a12.1
        for <oe-kbuild-all@lists.linux.dev>; Sun, 16 Feb 2025 07:44:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739720670; x=1740325470; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=I28Ltzbpz28nf3WFh+EJxqwTplUCP+BDNedS1zYYOoY=;
        b=x7hoOdPGIG8L2zn85ovV5iSAgNv1sgzsovx3KNKkcBMAlfkloLDRpjOgjrNyG7YZ4z
         ueuj7j173lzCAxBx/fTevocXa5nndAON7VgrGbf2KcBkU34aRCgJBdGKnGxyQwHNMYDn
         JZ4RIwqcCYaKnLTUMv5b5U8Vni+ZHrtGj7MAIgb5j+i8NJxd+6jW42cX8GTPuB6SNGUE
         e88J51L41WPOV2RClBFQ+j1n832bBuGIYqDKUUNHQD+UZrAIPbWdZmgy4zprOF1SzEE7
         2omIAs+gpMjPZWxgs0s1Ko1OXN/Z1+7tPmxiDn8U1ZlLb5M79KnKl2S07wD8UWUnq6ly
         axNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739720670; x=1740325470;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=I28Ltzbpz28nf3WFh+EJxqwTplUCP+BDNedS1zYYOoY=;
        b=bTwoNSRmZn0TS49O8jOEr5Dd2/itF7PFgbcC1lzzTmQ9pj51GiHEX7IdMLnae5dd/6
         TkGOgaXjBrHyUC6fy6GKUb/fxl9Nf+SAeZKDO19352vqgel6y8QFCz4cxFHXtNUXUXpR
         sMuGycSp7CSMDWtK8Rv/7MvljF+dC950x0kNKa6OL8atmWAIeJFcqjmAdI9t3/dNytUO
         8DIQEPrKzvQmbL9uYgy5VcN0PmFzOQRL5YBpAwq73Zq2spG7ZcyUtDXI/Ekr/ely8wor
         fAMixnm6hH1Vaf9KhwFSKWVebKZ/epujcez5hsLATDOikNROfCYy/lqVT7vIdbfzZAID
         OeFw==
X-Forwarded-Encrypted: i=1; AJvYcCWpsDlZJ4zK8yPp8eGnr0ASE+L3xDfUYyFMjdvhtXZVpsuP1rX5Z1dlzzEN7wCM9RZbeTLyZAXlooHJJjIt@lists.linux.dev
X-Gm-Message-State: AOJu0Yycpzoaku5NghwJtCTFdO4gu9yxkY+OmTmQchFzkbae3iTlYAVH
	aDgH85L7Atno0Mo6da2S21A5uY8IXNn3T1KLFCFFZv7OAXu0XhcgfCclkjJuRU4=
X-Gm-Gg: ASbGncufLAcBNy+hOhrcqELKpsO5k+zN5t1fWs2GJ5a7g5uSyBtLBaJ+qfYhPk7TyVK
	Tivdf1nGhMQqbb920Rq88VRsQhdFhEsSS1E3imAlxFfw/Kt034sZJYaviY+3mNh2lk/1PrmSx24
	AUEYRXL/CbRcFp2g2HokYWX5D0+oo8SJAe6/vWYCYJMvlKDQ+1UivMTa8RF6cz5HRErf5ruqstR
	fsJveKLhW/mmszixvpxTLD5007/HflHUEnBoZTGTPX6N1O8MU/F5BQnVEzaOsFE6UqkTpM5enYa
	b6ToI+wnvLkq4Y6g9I+n
X-Google-Smtp-Source: AGHT+IGalmCMovBb8mw1vJiBTYSPveBDmvGVL+JN+cezVE288JEGh5KoJgyvDoRxc4G60/UKr+IAVg==
X-Received: by 2002:a17:907:7f27:b0:ab7:10e1:8779 with SMTP id a640c23a62f3a-abb70bcba0bmr691709466b.27.1739720669685;
        Sun, 16 Feb 2025 07:44:29 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-aba5323202dsm720485766b.6.2025.02.16.07.44.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Feb 2025 07:44:29 -0800 (PST)
Date: Sun, 16 Feb 2025 18:44:25 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, cros-kernel-buildreports@googlegroups.com
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 1/1] fs/fuse/file.c:387
 fuse_file_release() error: we previously assumed 'ra' could be null (see
 line 373)
Message-ID: <d6800751-2fe6-478e-b104-1bbeab30ed04@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   0f556311bc475a36a147f111a9c5f0769a655730
commit: 8be90ef631b70dedc3c43b247aeae296a633dcb2 [1/1] ANDROID: fuse-bpf: fuse-bpf v1.2
config: i386-randconfig-141-20250216 (https://download.01.org/0day-ci/archive/20250216/202502161830.f3ssKogv-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202502161830.f3ssKogv-lkp@intel.com/

smatch warnings:
fs/fuse/file.c:387 fuse_file_release() error: we previously assumed 'ra' could be null (see line 373)

vim +/ra +387 fs/fuse/file.c

b9d54c6f29d9dc Miklos Szeredi   2021-04-07  364  void fuse_file_release(struct inode *inode, struct fuse_file *ff,
b9d54c6f29d9dc Miklos Szeredi   2021-04-07  365  		       unsigned int open_flags, fl_owner_t id, bool isdir)
fd72faac95d7e4 Miklos Szeredi   2005-11-07  366  {
b9d54c6f29d9dc Miklos Szeredi   2021-04-07  367  	struct fuse_inode *fi = get_fuse_inode(inode);
fc8ff397b2a915 Amir Goldstein   2024-02-09  368  	struct fuse_release_args *ra = &ff->args->release_args;
2e64ff154ce6ce Chad Austin      2018-12-10  369  	int opcode = isdir ? FUSE_RELEASEDIR : FUSE_RELEASE;
6b2db28a7a2da1 Tejun Heo        2009-04-14  370  
e26ee4efbc7961 Amir Goldstein   2024-02-01  371  	fuse_prepare_release(fi, ff, open_flags, opcode, false);
51eb01e73599ef Miklos Szeredi   2006-06-25  372  
e26ee4efbc7961 Amir Goldstein   2024-02-01 @373  	if (ra && ff->flock) {

Ths "ra" check is not required.

	if (ff->flock) {

4cb548666e4c13 Miklos Szeredi   2019-09-10  374  		ra->inarg.release_flags |= FUSE_RELEASE_FLOCK_UNLOCK;
b9d54c6f29d9dc Miklos Szeredi   2021-04-07  375  		ra->inarg.lock_owner = fuse_lock_owner_id(ff->fm->fc, id);
37fb3a30b46237 Miklos Szeredi   2011-08-08  376  	}
93a8c3cd9e9834 Miklos Szeredi   2007-10-18  377  
c756e0a4d79202 Miklos Szeredi   2007-10-16  378  	/*
6b2db28a7a2da1 Tejun Heo        2009-04-14  379  	 * Normally this will send the RELEASE request, however if
6b2db28a7a2da1 Tejun Heo        2009-04-14  380  	 * some asynchronous READ or WRITE requests are outstanding,
6b2db28a7a2da1 Tejun Heo        2009-04-14  381  	 * the sending will be delayed.
5a18ec176c934c Miklos Szeredi   2011-02-25  382  	 *
5a18ec176c934c Miklos Szeredi   2011-02-25  383  	 * Make the release synchronous if this is a fuseblk mount,
5a18ec176c934c Miklos Szeredi   2011-02-25  384  	 * synchronous RELEASE is allowed (and desirable) in this case
5a18ec176c934c Miklos Szeredi   2011-02-25  385  	 * because the server can be trusted not to screw up.
c756e0a4d79202 Miklos Szeredi   2007-10-16  386  	 */
8be90ef631b70d Daniel Rosenberg 2021-12-02 @387  	fuse_file_put(ra->inode, ff, ff->fm->fc->destroy);
b6aeadeda22a9a Miklos Szeredi   2005-09-09  388  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

