Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 263752367A0
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Sep 2025 10:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757759668; cv=none; b=WLcRPUv+lpqdmMckrqfoUkQkjoQn3JE7hiiua7ccZNsD4cVTTm8CX9MWQe7JUpw+frfpxtMHhH/dmC4LUjg7C6BfJpf8pSxE8SfyqnsU8rPy/rcOYG7iP1st1eb5vmEA5KpzqekvupyNJsEAwy4JV0YPIUtorrRtaMkrEnhN8bc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757759668; c=relaxed/simple;
	bh=h8JwbvwyW2P7gQFG2zaN5MiksCvFsFDvf6U9oStazJA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=f/jvRINsCdKT/um/LgpGbw6ks+/ZZgAZSNAs/XErrvKbecgkcH2OE76M9sf4ZoDDdk6ZN3Rv4SB7k4mrmvIatWqHwb0CiRp+3ND/8CiKpny4UbZy89jfME/80zwrU7MxV9/XkNig7R1r7heRP5/7ny/yeSxIo2K3y1+2KQIO9kc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=N1xIt8jA; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="N1xIt8jA"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-45dd7b15a64so24342525e9.0
        for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Sep 2025 03:34:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757759664; x=1758364464; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=v+GA69unbvtgXr6RVU3bFQ9DEodnNP5kqSiglG4UkRU=;
        b=N1xIt8jAvwroW6OM6LetZSoBSDwvCycw7GLOtMMKNuqHZb7EF26vcN0opUCqQoj0o0
         Y2KItF+g8mm34bqmD2RdWJbwgQJr+GY6a2FjCUkfdTrOj0WAS1NV3NbwAc3GAU9Rx7/O
         ZNFyE6lF4GJlV8UMo7KfFhoDHIUL3e/eIvNf6GZNTi8tONQm8T87IvkPrRSps74WvINN
         R3p+rWxPBRWW3gQyq3hC93npEa4G3BE+O4N7R6NMtm1Ml9JBY4QtbDSnOxsmVnNtUuQy
         Gs9xTMe5oisCVBYvYgdpbQI64LhmIkXyf890DCqCy/S43ri8S9OBq3uIyGGTgcuRIQU1
         aXcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757759664; x=1758364464;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=v+GA69unbvtgXr6RVU3bFQ9DEodnNP5kqSiglG4UkRU=;
        b=m0kzDwEPWUg1hm3OblupXi1GEsBXOgm0b0VBaTrtgu7djgbheQ6ThXVqdzsa2qkFYz
         pRI11hniMvdTQutNhJ2xceotyihr0YxjS7XZ/+L2S1+ztBF06TWik9T9zOznmkMTZvZP
         gpPRE7kP08SO1TdSdTohStgJ0c/Ua0XxFkGVT1iIaCJDADK4LikBCZxzA7tRczibVbII
         UD0V0QLrLJIuEfZPUwJ6xRmWobmFxYaSNFngTeUhM1tVZuI+x2V//e4jwS3ufrbqjz7p
         8SQ3Ga+/1NYifd82p1SAGflcA7g1mm4VcGTeSPwHlQfk1GN4Gt6a1apWUK7Uvz8DggWY
         kHIA==
X-Forwarded-Encrypted: i=1; AJvYcCXlATUjjf+7YZx9ozTU8flVBak1JZ+vDBsGu4maZKOpXX5MlIndgAdpmg+DJ+8JaAitYN0cgJhx+1uL4E0G@lists.linux.dev
X-Gm-Message-State: AOJu0YzydX82wBxBKD6r6sE2LlC56eI1B0uFyvzvdrwFGOVpKEs+jCDz
	M0fRwN6WdCMg1gfXvrRC/lKQa7iTd0quieRdr2oDggJ+kIw0+bJDAX5MuQW+nyLMiJ8=
X-Gm-Gg: ASbGnctr1OOtx7MKsu/Ewt0SPjsSHhWDK2FbC/wtaug87BYO2tOe3wFbfgu5MElp1P4
	DT2JR5U34QNK5jLUBs5h70SJO414FDsogsJrPajOpUEABphD5EXA8YmvjQm7nKPfdl+yffHVY2R
	HKGrWm7PhKnOlwqHDA0NC8YIS1rEKX2eoT9zvY+bEV6p4m2yygJ7VsFLXUye0lXzVUAkM3ywJJj
	3dKFFGQTV2QBUhMcZJEeRawEqM/3fsejrYOB9H0PaPLFkODH1fi9gbZC7Qq4p20Sg3VyjJaAlMo
	ue/nWuDEyRPW5+ev5x9vjzumpNSfIrFCqdS7zVnqDuP0gEe298iDW0+Roz0NCj5XIF+ZIa8bx34
	d9z2HIjls2PJ2NZTlfqELVE/QONw=
X-Google-Smtp-Source: AGHT+IG+KxBywTWC73f20ZIoRXzpjdjLkuMkfOI+yS//wh7s1CqTwE5rmFi7w8RMhHIM5dY/jksVVQ==
X-Received: by 2002:a05:600c:49a2:b0:45b:92a6:63e3 with SMTP id 5b1f17b1804b1-45dfd5e3d5bmr65229385e9.9.1757759664273;
        Sat, 13 Sep 2025 03:34:24 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3e760777851sm9950677f8f.4.2025.09.13.03.34.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Sep 2025 03:34:23 -0700 (PDT)
Date: Sat, 13 Sep 2025 13:34:20 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, NeilBrown <neil@brown.name>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Chuck Lever <chuck.lever@oracle.com>,
	Jeff Layton <jlayton@kernel.org>
Subject: [cel:nfsd-testing 45/50] fs/nfsd/nfs4recover.c:406 purge_old()
 error: uninitialized symbol 'child'.
Message-ID: <202509131751.4STnDcZg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cel/linux nfsd-testing
head:   454e99ac23dc63c1472eb5df8f97c961c0f178c9
commit: 30424fb94b7bea14e27922669924948d6320e991 [45/50] nfsd: move name lookup out of nfsd4_list_rec_dir()
config: sparc64-randconfig-r072-20250913 (https://download.01.org/0day-ci/archive/20250913/202509131751.4STnDcZg-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 15.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202509131751.4STnDcZg-lkp@intel.com/

smatch warnings:
fs/nfsd/nfs4recover.c:406 purge_old() error: uninitialized symbol 'child'.

vim +/child +406 fs/nfsd/nfs4recover.c

c7b9a45927e74c8 NeilBrown         2005-06-23  398  static int
30424fb94b7bea1 NeilBrown         2025-09-08  399  purge_old(struct dentry *parent, char *cname, struct nfsd_net *nn)
c7b9a45927e74c8 NeilBrown         2005-06-23  400  {
c7b9a45927e74c8 NeilBrown         2005-06-23  401  	int status;
30424fb94b7bea1 NeilBrown         2025-09-08  402  	struct dentry *child;
6b1891052a3f8e3 Scott Mayhew      2019-03-26  403  	struct xdr_netobj name;
c7b9a45927e74c8 NeilBrown         2005-06-23  404  
30424fb94b7bea1 NeilBrown         2025-09-08  405  	if (strlen(cname) != HEXDIR_LEN - 1) {
6b1891052a3f8e3 Scott Mayhew      2019-03-26 @406  		printk("%s: illegal name %pd in recovery directory\n",
6b1891052a3f8e3 Scott Mayhew      2019-03-26  407  				__func__, child);
                                                                                          ^^^^^
s/child/cname/

6b1891052a3f8e3 Scott Mayhew      2019-03-26  408  		/* Keep trying; maybe the others are OK: */
b37ad28bcaa7c48 Al Viro           2006-10-19  409  		return 0;
6b1891052a3f8e3 Scott Mayhew      2019-03-26  410  	}
30424fb94b7bea1 NeilBrown         2025-09-08  411  	name.data = kstrdup(cname, GFP_KERNEL);
6b1891052a3f8e3 Scott Mayhew      2019-03-26  412  	if (!name.data) {
6b1891052a3f8e3 Scott Mayhew      2019-03-26  413  		dprintk("%s: failed to allocate memory for name.data!\n",
6b1891052a3f8e3 Scott Mayhew      2019-03-26  414  			__func__);
6b1891052a3f8e3 Scott Mayhew      2019-03-26  415  		goto out;
6b1891052a3f8e3 Scott Mayhew      2019-03-26  416  	}
6b1891052a3f8e3 Scott Mayhew      2019-03-26  417  	name.len = HEXDIR_LEN;
6b1891052a3f8e3 Scott Mayhew      2019-03-26  418  	if (nfs4_has_reclaimed_state(name, nn))
6b1891052a3f8e3 Scott Mayhew      2019-03-26  419  		goto out_free;
c7b9a45927e74c8 NeilBrown         2005-06-23  420  
30424fb94b7bea1 NeilBrown         2025-09-08  421  	inode_lock_nested(d_inode(parent), I_MUTEX_PARENT);
30424fb94b7bea1 NeilBrown         2025-09-08  422  	child = lookup_one(&nop_mnt_idmap, &QSTR(cname), parent);
30424fb94b7bea1 NeilBrown         2025-09-08  423  	if (!IS_ERR(child)) {
abf08576afe3150 Christian Brauner 2023-01-13  424  		status = vfs_rmdir(&nop_mnt_idmap, d_inode(parent), child);
c7b9a45927e74c8 NeilBrown         2005-06-23  425  		if (status)
a6a9f18f0a9f943 Al Viro           2013-09-16  426  			printk("failed to remove client recovery directory %pd\n",
a6a9f18f0a9f943 Al Viro           2013-09-16  427  			       child);
30424fb94b7bea1 NeilBrown         2025-09-08  428  		dput(child);
30424fb94b7bea1 NeilBrown         2025-09-08  429  	}
30424fb94b7bea1 NeilBrown         2025-09-08  430  	inode_unlock(d_inode(parent));
30424fb94b7bea1 NeilBrown         2025-09-08  431  
6b1891052a3f8e3 Scott Mayhew      2019-03-26  432  out_free:
6b1891052a3f8e3 Scott Mayhew      2019-03-26  433  	kfree(name.data);
6b1891052a3f8e3 Scott Mayhew      2019-03-26  434  out:
c7b9a45927e74c8 NeilBrown         2005-06-23  435  	/* Keep trying, success or failure: */
b37ad28bcaa7c48 Al Viro           2006-10-19  436  	return 0;
c7b9a45927e74c8 NeilBrown         2005-06-23  437  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

