Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5C1E267B92
	for <oe-kbuild-all@lists.linux.dev>; Thu, 18 Dec 2025 07:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766042279; cv=none; b=H0cGgd1hHPy4/tc5Pu9KcAIwlqN2VaZHuZEFk2mbDt/+4Nn0WOvaAicvrmVMSZLzuHyDEvkFvvvzV5uZ5Z2GwXLmEKoY53Z8LQkndMwewGHpnx8rbV31DnvJYYuSff+qIvAzsWBLaMylou9YJpJe5OhUG7IOGCMHShSUuNM9QsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766042279; c=relaxed/simple;
	bh=ZG2uGVos9jKrEEh0YiSgQg9bh1K8XhAuGphKItgKMUc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=W8l3oUUoo3A716/0QuCduzllCHatsZceYnyoVfs/byZvlopX1/w4a6afAoPhcxHxvEFMKuoSBUnAkVdRcVGnb2Nf8sMBKrPPKI/jL8/cRJpRteGBIwMsE97/CXQCEe5nSMNqmOVJnegvjKrSCAC+CMcfLoCKa0ybj+XBD1875bY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FLJXmzVC; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FLJXmzVC"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-42fbad1fa90so249444f8f.0
        for <oe-kbuild-all@lists.linux.dev>; Wed, 17 Dec 2025 23:17:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1766042276; x=1766647076; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Jf5BAcGhlQ0Lnqc8uMzINeGbDdKgDigIFHuO+3zKQo4=;
        b=FLJXmzVC/oijd18fCwV54NVrhv97SIPJOI3ctrOMCp1zzrxRCF/zNTru10IpY9aXyP
         Lx3s3PUXxTxgxiFhxF2bJcwz0J8ODJznGy7/MAOzV9CE3StEN6iRKez3wAawj/ZaTidg
         /sqjokOvc4tXuz6iGN545oAsKsGPmVNc4korcgSVXOrmYo4iQHQq1o8v7gBDMX8dPfiw
         xxl5cWzP5/oF7eXi2eDs4bGm3HBcmmv5tY1ikxHuSONHjIFSdNGNOYXths28eDsH1bEq
         xu8VYX2YNw5ufgtBVAHnr5Cxdnj3YoR2kS98+ShdEe4DzmG/92IwO27yhJCEPUP59Uj1
         W8lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766042276; x=1766647076;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Jf5BAcGhlQ0Lnqc8uMzINeGbDdKgDigIFHuO+3zKQo4=;
        b=DMhrzw2gvXtcak9taDirhhU6PDYiJ3PvOyDMiqxJl7sKrI456KygACmCoLVcUydKez
         DoCueKE2qpvS0gxAfAmUmr3yof83hjU6su6xJZ5PL+8eQoIcyt+9SrbJ+WGJdSLCo4Gd
         /OKkn3tTcha/O27bjBpZfLZfyZE1y/Ug6hjvLAOcFRdaD0C87z9gMWAP9DAdrj/24xag
         KNgOVntJByVchfjNkvGQAzN7kkafkE4pDTNmGV0RJtdBB4bEUOTi2h2opMlEG2CMYWLG
         jNWxWEHxEYhBTY6iNwXa40gp8SFW77ZkPFM4WHl7XT/B7eJvnJR6RmKrE+xOGcjYFLFN
         NKRw==
X-Forwarded-Encrypted: i=1; AJvYcCWV+n/osJrRRBUFfJ+ltXB4zRDirRjU2XHzNId3i5fATKXRR5emjJwHh40ejZMHpufkRxvDSTb1MOHosAXt@lists.linux.dev
X-Gm-Message-State: AOJu0YzosuuhxfvhW3fYgu21IhdkctnOxIxoSAaPAXwxmCQm4bO/II9i
	HkN6U9hJhLK/55vvV1WOLLjfo7btRuoOQsojGQ4eUg9IBNCAsmtHycJab4fxmHl0iV8=
X-Gm-Gg: AY/fxX62rytdaVwI5Eo/TaDRUn9H279P3fShXpeP7i8CMCJ43Rp+pRZoYwhwureLI9r
	5Ne3z2A3u2nH31s7U8r69uQT+9zRyFi4Q9+KTHD9d6qrcyJtF6YWcLYvVSi8LgN7gTnjef5Zfp/
	VTZJqesGqxnLs8PguH0NyNenRnmEEYpybDVbwL57zgtmO2BkvJC957Ap4hcMxiU80PKOhujMz9M
	S3Z/ryOx4ep5GSM74uo5jzerAwimX3oOFvH6s7n6DcTJtc4EF4JP7lE+pA3EphbKwIh0/JM3LBt
	TVaarS+IJ65lcLKw21wu98lUOMjc19g8jA3Jy6zdddlDk1xmUBDM2Uqw8kxUK6zw0QJFvPJOxSM
	+b+c1WIDbzDXcAI8hbzXYIJYeLHhTO5piKjRDxx2/rmElfn/Ftpch8z+GNw639StV2aeRWAJGdD
	h5PF6n6bTco7lxoA2g
X-Google-Smtp-Source: AGHT+IHP0/nOTUAYZJnjYxs4Ze+aKEzrPADjEBA33VeDRR8gsG0whl1HjnLrlF5DyOhSaqSl0ytkbQ==
X-Received: by 2002:a05:6000:2c0d:b0:431:a16:5533 with SMTP id ffacd0b85a97d-4310a1656f6mr6517869f8f.31.1766042275841;
        Wed, 17 Dec 2025 23:17:55 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324493fd73sm3294161f8f.13.2025.12.17.23.17.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 23:17:55 -0800 (PST)
Date: Thu, 18 Dec 2025 10:17:52 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Alice Ryhl <aliceryhl@google.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Matt Gilbride <mattgilbride@google.com>
Subject: drivers/android/binder/rust_binderfs.c:134
 binderfs_binder_device_create() error: Calling ida_alloc_max() with a 'max'
 argument which is a power of 2. -1 missing?
Message-ID: <202512181203.IOv6IChH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ea1013c1539270e372fc99854bc6e4d94eaeff66
commit: eafedbc7c050c44744fbdf80bdf3315e860b7513 rust_binder: add Rust Binder driver
config: loongarch-randconfig-r071-20251218 (https://download.01.org/0day-ci/archive/20251218/202512181203.IOv6IChH-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 1335a05ab8bc8339ce24be3a9da89d8c3f4e0571)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202512181203.IOv6IChH-lkp@intel.com/

smatch warnings:
drivers/android/binder/rust_binderfs.c:134 binderfs_binder_device_create() error: Calling ida_alloc_max() with a 'max' argument which is a power of 2. -1 missing?
drivers/android/binder/rust_binderfs.c:418 binderfs_binder_ctl_create() error: Calling ida_alloc_max() with a 'max' argument which is a power of 2. -1 missing?

vim +/max +134 drivers/android/binder/rust_binderfs.c

eafedbc7c050c4 Alice Ryhl 2025-09-19  130  
eafedbc7c050c4 Alice Ryhl 2025-09-19  131  	/* Reserve new minor number for the new device. */
eafedbc7c050c4 Alice Ryhl 2025-09-19  132  	mutex_lock(&binderfs_minors_mutex);
eafedbc7c050c4 Alice Ryhl 2025-09-19  133  	if (++info->device_count <= info->mount_opts.max)
eafedbc7c050c4 Alice Ryhl 2025-09-19 @134  		minor = ida_alloc_max(&binderfs_minors,
eafedbc7c050c4 Alice Ryhl 2025-09-19  135  				      use_reserve ? BINDERFS_MAX_MINOR :
eafedbc7c050c4 Alice Ryhl 2025-09-19  136  						    BINDERFS_MAX_MINOR_CAPPED,

ida_alloc_max() takes the maximum valid id not the count.  These should
be BINDERFS_MAX_MINOR - 1, BINDERFS_MAX_MINOR_CAPPED - 1.

eafedbc7c050c4 Alice Ryhl 2025-09-19  137  				      GFP_KERNEL);
eafedbc7c050c4 Alice Ryhl 2025-09-19  138  	else
eafedbc7c050c4 Alice Ryhl 2025-09-19  139  		minor = -ENOSPC;
eafedbc7c050c4 Alice Ryhl 2025-09-19  140  	if (minor < 0) {
eafedbc7c050c4 Alice Ryhl 2025-09-19  141  		--info->device_count;
eafedbc7c050c4 Alice Ryhl 2025-09-19  142  		mutex_unlock(&binderfs_minors_mutex);
eafedbc7c050c4 Alice Ryhl 2025-09-19  143  		return minor;
eafedbc7c050c4 Alice Ryhl 2025-09-19  144  	}
eafedbc7c050c4 Alice Ryhl 2025-09-19  145  	mutex_unlock(&binderfs_minors_mutex);
eafedbc7c050c4 Alice Ryhl 2025-09-19  146  
eafedbc7c050c4 Alice Ryhl 2025-09-19  147  	ret = -ENOMEM;
eafedbc7c050c4 Alice Ryhl 2025-09-19  148  	device = kzalloc(sizeof(*device), GFP_KERNEL);
eafedbc7c050c4 Alice Ryhl 2025-09-19  149  	if (!device)
eafedbc7c050c4 Alice Ryhl 2025-09-19  150  		goto err;
eafedbc7c050c4 Alice Ryhl 2025-09-19  151  
eafedbc7c050c4 Alice Ryhl 2025-09-19  152  	req->name[BINDERFS_MAX_NAME] = '\0'; /* NUL-terminate */
eafedbc7c050c4 Alice Ryhl 2025-09-19  153  
eafedbc7c050c4 Alice Ryhl 2025-09-19  154  	ctx = rust_binder_new_context(req->name);
eafedbc7c050c4 Alice Ryhl 2025-09-19  155  	if (!ctx)
eafedbc7c050c4 Alice Ryhl 2025-09-19  156  		goto err;
eafedbc7c050c4 Alice Ryhl 2025-09-19  157  
eafedbc7c050c4 Alice Ryhl 2025-09-19  158  	inode = new_inode(sb);
eafedbc7c050c4 Alice Ryhl 2025-09-19  159  	if (!inode)
eafedbc7c050c4 Alice Ryhl 2025-09-19  160  		goto err;
eafedbc7c050c4 Alice Ryhl 2025-09-19  161  
eafedbc7c050c4 Alice Ryhl 2025-09-19  162  	inode->i_ino = minor + INODE_OFFSET;
eafedbc7c050c4 Alice Ryhl 2025-09-19  163  	simple_inode_init_ts(inode);
eafedbc7c050c4 Alice Ryhl 2025-09-19  164  	init_special_inode(inode, S_IFCHR | 0600,
eafedbc7c050c4 Alice Ryhl 2025-09-19  165  			   MKDEV(MAJOR(binderfs_dev), minor));
eafedbc7c050c4 Alice Ryhl 2025-09-19  166  	inode->i_fop = &rust_binder_fops;
eafedbc7c050c4 Alice Ryhl 2025-09-19  167  	inode->i_uid = info->root_uid;
eafedbc7c050c4 Alice Ryhl 2025-09-19  168  	inode->i_gid = info->root_gid;
eafedbc7c050c4 Alice Ryhl 2025-09-19  169  
eafedbc7c050c4 Alice Ryhl 2025-09-19  170  	req->major = MAJOR(binderfs_dev);
eafedbc7c050c4 Alice Ryhl 2025-09-19  171  	req->minor = minor;
eafedbc7c050c4 Alice Ryhl 2025-09-19  172  	device->ctx = ctx;
eafedbc7c050c4 Alice Ryhl 2025-09-19  173  	device->minor = minor;
eafedbc7c050c4 Alice Ryhl 2025-09-19  174  
eafedbc7c050c4 Alice Ryhl 2025-09-19  175  	if (userp && copy_to_user(userp, req, sizeof(*req))) {
eafedbc7c050c4 Alice Ryhl 2025-09-19  176  		ret = -EFAULT;
eafedbc7c050c4 Alice Ryhl 2025-09-19  177  		goto err;
eafedbc7c050c4 Alice Ryhl 2025-09-19  178  	}
eafedbc7c050c4 Alice Ryhl 2025-09-19  179  
eafedbc7c050c4 Alice Ryhl 2025-09-19  180  	root = sb->s_root;
eafedbc7c050c4 Alice Ryhl 2025-09-19  181  	inode_lock(d_inode(root));
eafedbc7c050c4 Alice Ryhl 2025-09-19  182  
eafedbc7c050c4 Alice Ryhl 2025-09-19  183  	/* look it up */
eafedbc7c050c4 Alice Ryhl 2025-09-19  184  	dentry = lookup_noperm(&QSTR(req->name), root);
eafedbc7c050c4 Alice Ryhl 2025-09-19  185  	if (IS_ERR(dentry)) {
eafedbc7c050c4 Alice Ryhl 2025-09-19  186  		inode_unlock(d_inode(root));
eafedbc7c050c4 Alice Ryhl 2025-09-19  187  		ret = PTR_ERR(dentry);
eafedbc7c050c4 Alice Ryhl 2025-09-19  188  		goto err;
eafedbc7c050c4 Alice Ryhl 2025-09-19  189  	}
eafedbc7c050c4 Alice Ryhl 2025-09-19  190  
eafedbc7c050c4 Alice Ryhl 2025-09-19  191  	if (d_really_is_positive(dentry)) {
eafedbc7c050c4 Alice Ryhl 2025-09-19  192  		/* already exists */
eafedbc7c050c4 Alice Ryhl 2025-09-19  193  		dput(dentry);
eafedbc7c050c4 Alice Ryhl 2025-09-19  194  		inode_unlock(d_inode(root));
eafedbc7c050c4 Alice Ryhl 2025-09-19  195  		ret = -EEXIST;
eafedbc7c050c4 Alice Ryhl 2025-09-19  196  		goto err;
eafedbc7c050c4 Alice Ryhl 2025-09-19  197  	}
eafedbc7c050c4 Alice Ryhl 2025-09-19  198  
eafedbc7c050c4 Alice Ryhl 2025-09-19  199  	inode->i_private = device;
eafedbc7c050c4 Alice Ryhl 2025-09-19  200  	d_instantiate(dentry, inode);
eafedbc7c050c4 Alice Ryhl 2025-09-19  201  	fsnotify_create(root->d_inode, dentry);
eafedbc7c050c4 Alice Ryhl 2025-09-19  202  	inode_unlock(d_inode(root));
eafedbc7c050c4 Alice Ryhl 2025-09-19  203  
eafedbc7c050c4 Alice Ryhl 2025-09-19  204  	return 0;
eafedbc7c050c4 Alice Ryhl 2025-09-19  205  
eafedbc7c050c4 Alice Ryhl 2025-09-19  206  err:
eafedbc7c050c4 Alice Ryhl 2025-09-19  207  	kfree(device);
eafedbc7c050c4 Alice Ryhl 2025-09-19  208  	rust_binder_remove_context(ctx);
eafedbc7c050c4 Alice Ryhl 2025-09-19  209  	mutex_lock(&binderfs_minors_mutex);
eafedbc7c050c4 Alice Ryhl 2025-09-19  210  	--info->device_count;
eafedbc7c050c4 Alice Ryhl 2025-09-19  211  	ida_free(&binderfs_minors, minor);
eafedbc7c050c4 Alice Ryhl 2025-09-19  212  	mutex_unlock(&binderfs_minors_mutex);
eafedbc7c050c4 Alice Ryhl 2025-09-19  213  	iput(inode);
eafedbc7c050c4 Alice Ryhl 2025-09-19  214  
eafedbc7c050c4 Alice Ryhl 2025-09-19  215  	return ret;
eafedbc7c050c4 Alice Ryhl 2025-09-19  216  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

