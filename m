Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3EED38DD4
	for <oe-kbuild-all@lists.linux.dev>; Thu,  6 Jun 2024 17:49:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717696155; cv=none; b=rO7ikGR7Z+5jZrhGVBykN3ZYjM8avDVSnhEEmUdAZiuUj18zJkOSwOCGqi9Y8o6mUXrufOiUf1o3pPLbspKuc5GSxj2Bqay89TKwAA9B8I6uvRcDlIwrevZeRL4DDaKFEOnUJRxpicplvm9pGq+wjB9xsILitNLJVKRoLHVk1fY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717696155; c=relaxed/simple;
	bh=ht+znxs5l6kLl8IhQKotpZDYBUAbyPkbEB8TP2+s2GI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cvHaLoSDvgM/rlJh2EqbzSyZGGq1BhD2ttuQf/Pd2FliIV7h9Ijj+0AirokJKObPRh2lZtyzEOM8cBU8tJ3a1wmvnqytJ3OEN2yXswotnddcgaVBf1XkKGKLLNLWFmUsl/CstP/Y5ATDpgEjBBaYFQX9nqaB/vbWIr59Tep5qmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DN/iJ67Z; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DN/iJ67Z"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a6c828238dcso104271066b.0
        for <oe-kbuild-all@lists.linux.dev>; Thu, 06 Jun 2024 10:49:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717696152; x=1718300952; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IOyxONaSy+LRq9pRPVDu/2DPzNBcE4m+p0tauA4Jvwg=;
        b=DN/iJ67ZgJaHkhb38FDCBkL45acWo20GKw8z/clGoTsOhdGeYnhenOhefceV0MoQcR
         ZJ4EySOxBLuvkc3cINyzmDHcTNptkMnOUIlkrBb8siANz9V4yaab/rK1T649Vzl2UlVh
         Yvy4/Gkm4rJ93tIDVwS5Qje4WdhlgURIzSpTc30ufQdLwtWSxXNSvTpbDWBmXd2I5A+t
         Ck5a7cwn84d+5JbukEwEPzs6Bh9oEOfmxL+O2+tJOzUggCBQvhhOvpnxjxz6c1MM88jm
         EN2IUYInWfxaNF4tMmDQ6qzlieNDyrn93HqaXU/O7s5weFUXAqaWR/bjmp5eTSTzW8mv
         Bnsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717696152; x=1718300952;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IOyxONaSy+LRq9pRPVDu/2DPzNBcE4m+p0tauA4Jvwg=;
        b=Itd1MrJeN6XH1ZNScJ0X0QjNq6X7FisgBFVreuOAQsdN1kX2JhtXvqKrrcAAJxgcB3
         8bjiGhVzB4TFyGne1+KPWWroEpgiW25toxh0zLhLrXv8hI0QUJ9lMqmIu4DA8qwW21sz
         CGW+frJ10xRXEYGNZMpOUdp/4VOrSugbmobLHkXfus1TQzs2o8XHAehW/FFQLotkmEY6
         7Ue43UuVludBBVJt6HGeCp9Gos4bEqiUleY0AvTM2fR2l4R428c4WeJP7oYyNdAM2XKY
         egSzqYh+XDgnOo/hphyexsg5SMicpDzjki9o2Xt/uIRKGb+3ek6o1VVlk+mqw9o6V0rA
         qxlg==
X-Forwarded-Encrypted: i=1; AJvYcCWkFb2UMsDAXinmwxmnqAEvt0HyDMX7EpRb0ebRxobodu0ypYuouPqONjMZ1uIcSMH6iF9LRrYpPSeBVQdCiWcmpSJhkJbSWRdeRUVDtA==
X-Gm-Message-State: AOJu0YzLjSkr1oqc+Gm5u8fASJywMG05VR/4vecXPya0lOvCvz8cQpS3
	WHFFXfWaQlIpDEvrvru/L2UKacbwY5tblU/sJvXRfscA44EoymZ7IKFs77qA3TU=
X-Google-Smtp-Source: AGHT+IFTvR26eUayg/RXxCKRyU7kfHL7y/n0b9XpVO7Qfw00Y6smSPHz/brwQ8UOl1jqbmyhPKwDTg==
X-Received: by 2002:a17:906:fcc7:b0:a66:4cf6:b9c with SMTP id a640c23a62f3a-a6cd7891a7fmr19004266b.45.1717696151712;
        Thu, 06 Jun 2024 10:49:11 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6c806ebdc7sm124115566b.136.2024.06.06.10.49.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jun 2024 10:49:11 -0700 (PDT)
Date: Thu, 6 Jun 2024 20:49:06 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Christian Brauner <brauner@kernel.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Christian Brauner <christianvanbrauner@gmail.com>
Subject: [brauner-vfs:vfs.open_tree 5/7] fs/namespace.c:4149
 __do_sys_fsmount() error: uninitialized symbol 'ret'.
Message-ID: <344a0884-4a59-4565-b6e0-e91f87aa420e@moroto.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git vfs.open_tree
head:   6d2ad41f48768f325a552666b71724bc40ba52c3
commit: 5612eb55c0193003973838c198268730bd4682ce [5/7] fs: add open_tree() context
config: hexagon-randconfig-r071-20240606 (https://download.01.org/0day-ci/archive/20240607/202406070149.3roPeXKi-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project d7d2d4f53fc79b4b58e8d8d08151b577c3699d4a)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202406070149.3roPeXKi-lkp@intel.com/

New smatch warnings:
fs/namespace.c:4149 __do_sys_fsmount() error: uninitialized symbol 'ret'.

vim +/ret +4149 fs/namespace.c

5612eb55c019300 Christian Brauner 2024-05-31  4098  SYSCALL_DEFINE3(fsmount, int, fs_fd, unsigned int, flags,
5612eb55c019300 Christian Brauner 2024-05-31  4099  		unsigned int, attr_flags)
5612eb55c019300 Christian Brauner 2024-05-31  4100  {
5612eb55c019300 Christian Brauner 2024-05-31  4101  	struct fs_context *fc;
5612eb55c019300 Christian Brauner 2024-05-31  4102  	unsigned int mnt_flags = 0;
5612eb55c019300 Christian Brauner 2024-05-31  4103  	long ret;
5612eb55c019300 Christian Brauner 2024-05-31  4104  
5612eb55c019300 Christian Brauner 2024-05-31  4105  	if (!may_mount())
5612eb55c019300 Christian Brauner 2024-05-31  4106  		return -EPERM;
5612eb55c019300 Christian Brauner 2024-05-31  4107  
5612eb55c019300 Christian Brauner 2024-05-31  4108  	if ((flags & ~(FSMOUNT_CLOEXEC)) != 0)
5612eb55c019300 Christian Brauner 2024-05-31  4109  		return -EINVAL;
5612eb55c019300 Christian Brauner 2024-05-31  4110  
5612eb55c019300 Christian Brauner 2024-05-31  4111  	if (attr_flags & ~FSMOUNT_VALID_FLAGS)
5612eb55c019300 Christian Brauner 2024-05-31  4112  		return -EINVAL;
5612eb55c019300 Christian Brauner 2024-05-31  4113  
5612eb55c019300 Christian Brauner 2024-05-31  4114  	mnt_flags = attr_flags_to_mnt_flags(attr_flags);
5612eb55c019300 Christian Brauner 2024-05-31  4115  
5612eb55c019300 Christian Brauner 2024-05-31  4116  	switch (attr_flags & MOUNT_ATTR__ATIME) {
5612eb55c019300 Christian Brauner 2024-05-31  4117  	case MOUNT_ATTR_STRICTATIME:
5612eb55c019300 Christian Brauner 2024-05-31  4118  		break;
5612eb55c019300 Christian Brauner 2024-05-31  4119  	case MOUNT_ATTR_NOATIME:
5612eb55c019300 Christian Brauner 2024-05-31  4120  		mnt_flags |= MNT_NOATIME;
5612eb55c019300 Christian Brauner 2024-05-31  4121  		break;
5612eb55c019300 Christian Brauner 2024-05-31  4122  	case MOUNT_ATTR_RELATIME:
5612eb55c019300 Christian Brauner 2024-05-31  4123  		mnt_flags |= MNT_RELATIME;
5612eb55c019300 Christian Brauner 2024-05-31  4124  		break;
5612eb55c019300 Christian Brauner 2024-05-31  4125  	default:
5612eb55c019300 Christian Brauner 2024-05-31  4126  		return -EINVAL;
5612eb55c019300 Christian Brauner 2024-05-31  4127  	}
5612eb55c019300 Christian Brauner 2024-05-31  4128  
5612eb55c019300 Christian Brauner 2024-05-31  4129  	CLASS(fd, f)(fs_fd);
5612eb55c019300 Christian Brauner 2024-05-31  4130  	if (!f.file)
5612eb55c019300 Christian Brauner 2024-05-31  4131  		return -EBADF;
5612eb55c019300 Christian Brauner 2024-05-31  4132  
5612eb55c019300 Christian Brauner 2024-05-31  4133  	if (!(f.file->f_op->fop_flags & FOP_FS_CONTEXT_OPS))
5612eb55c019300 Christian Brauner 2024-05-31  4134  		return -EINVAL;
5612eb55c019300 Christian Brauner 2024-05-31  4135  
5612eb55c019300 Christian Brauner 2024-05-31  4136  	if ((f.file->f_op == &mount_context_ops) && attr_flags)
5612eb55c019300 Christian Brauner 2024-05-31  4137  		return -EINVAL;
5612eb55c019300 Christian Brauner 2024-05-31  4138  
5612eb55c019300 Christian Brauner 2024-05-31  4139  	fc = f.file->private_data;
5612eb55c019300 Christian Brauner 2024-05-31  4140  	scoped_cond_guard(mutex_intr, return -EINTR, &fc->uapi_mutex) {
5612eb55c019300 Christian Brauner 2024-05-31  4141  		if (fc->phase != FS_CONTEXT_AWAITING_MOUNT)
5612eb55c019300 Christian Brauner 2024-05-31  4142  			return -EBUSY;
5612eb55c019300 Christian Brauner 2024-05-31  4143  		if (f.file->f_op == &fscontext_fops)
5612eb55c019300 Christian Brauner 2024-05-31  4144  			ret = fsmount_fscontext(fc, flags, mnt_flags);
5612eb55c019300 Christian Brauner 2024-05-31  4145  		else if (f.file->f_op == &mount_context_ops)
5612eb55c019300 Christian Brauner 2024-05-31  4146  			ret = fsmount_mount_context(fc, flags);

ret not initliazed on else path.

5612eb55c019300 Christian Brauner 2024-05-31  4147  	}
5612eb55c019300 Christian Brauner 2024-05-31  4148  
93766fbd2696c2c David Howells     2018-11-01 @4149  	return ret;
93766fbd2696c2c David Howells     2018-11-01  4150  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

