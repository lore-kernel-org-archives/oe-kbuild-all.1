Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9E8E17BA9
	for <oe-kbuild-all@lists.linux.dev>; Mon, 27 May 2024 07:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716794937; cv=none; b=oFgW8JZ1DrBZlkenlwOgb+vLMKuWoTIJrs5gPN3/TAu++/Ia6XUTjkEzXPaSHZF4qtGue8PWOvN8em0IBYWIXUaFzUUZGl75rPiDyA2prNE+HAmIrX6d+EuTo1oOVbN6rNWOXbM6TBm4sLaN32qbqSLoAy/jo/oNJh69LxykBi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716794937; c=relaxed/simple;
	bh=ckXZcJ1HQdTF2NiU9KbzpEcKqcitdSKRyLTinttGzUo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=Eo6F71kknYwZhLeggFg1os6EysSaWh1RIT7tqjrUhO+4BbFbPYANVd9+hNhY8iuTUSXTp/ffdJNMX4olSj3O9WAznwU0/HSM6Q4zSCizFhJEQUdYxkN7fYuPzi8u7o5Q/eHVC4+ECsa0HahqR9GkbweJN4Rk7GC8eAaVboe3IL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xO7wxb9v; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xO7wxb9v"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a6267778b3aso180740066b.3
        for <oe-kbuild-all@lists.linux.dev>; Mon, 27 May 2024 00:28:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716794934; x=1717399734; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=a3vF6PVLwzw2IhtdTnG4BnmhIDmBIIr8HgiLs/H36k8=;
        b=xO7wxb9v5zL1Usat0OVKrV2mFypTzXl0BaVJldrWWGWHPBirEJJSQRu3JeO9/Mr0nG
         UsXZq9d0Oy7aBESsIHM0RsAmLW40V4wC3EhvL+eOOFMwB4eILq4HW68s3isRlfS1lBUj
         C/n02GZJQPrbN9RGx27PCPvte2lzZHfCq/ienVdUwCjkt0vyA3cCeox7p48bsnA9wZzm
         kAkyWokz4LUDqeWugiLYy8Mx42zEjKpcJ8gUU7GkFygD+vWbuVIsJVFoSnFlF3cbm/hX
         l2YxzjhlEGqaiNUHPPJH6gLryidJnbVe7TdZgdRCjqU/4grNvUwMSH74IYyLb2Nra+eF
         BMDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716794934; x=1717399734;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a3vF6PVLwzw2IhtdTnG4BnmhIDmBIIr8HgiLs/H36k8=;
        b=AcD9LlMnBdvaDSWusNpaymYP8cwmGBU6v5Hgo0bwIGYzq/LWAgAU+3OSpzElUufhXX
         IaJGqjdrWNioF6TwkxZzje2SuzZJdtC7pEYKpjfqn5VxAF734S7KBYmfh+vAkfUUh+Ml
         lCGDTeDLXn1/ny4boqmSdk9CDk2kIN+a4+bfvScb6WxWFeRjAqg1oBq8ztH2z7vMUzPu
         Rd4u/LMdMf8eiNs3k7l0BuxMtj/w3jopOqZfHY89KSs1ea0fjwzbFtQMpDNkRYcGENAy
         xiINkNB1F+Zv5Oyp8BaZ7csU96fLtMo6XcchlyJy3hiI9XpThBLA+Af9HR1iViN5X/jo
         4reg==
X-Forwarded-Encrypted: i=1; AJvYcCXIehGckRRqprTR8RUKkWxQnPYGsRfu6xiosr7/CLAml2i8aEWBkcjJIs0X6t5qZx66ytoMY7+T5ITKko1qdZW/DKCqIE7LuYA4DjpFTw==
X-Gm-Message-State: AOJu0Yx2alWQqfKZHlXjMv2lJwIrPKWyjMX3qK3RXlE/dPyWwwkV9ozL
	hPcZNNhe+qbqxg0VUzQhKl409JGGVMTnmGznF++K2Cxh35r7ZSsshrcuFLeI/GE=
X-Google-Smtp-Source: AGHT+IGyvK9MdJ1m0qmFKThp0UhZOc1TvKjGLWULWR/CFlazWdKAmYIVzxc4gqzhKhRdKASQ45SUIQ==
X-Received: by 2002:a17:906:b0c5:b0:a59:b490:e77b with SMTP id a640c23a62f3a-a62646d6a39mr554535466b.40.1716794934034;
        Mon, 27 May 2024 00:28:54 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a626cda46e1sm458912266b.196.2024.05.27.00.28.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 May 2024 00:28:53 -0700 (PDT)
Date: Mon, 27 May 2024 10:28:49 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Christian Brauner <brauner@kernel.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC] : fhandle: relax open_by_handle_at() permission
 checks
Message-ID: <a1a997c2-9a12-49d6-882b-13b96ba7d1cc@moroto.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240524-vfs-open_by_handle_at-v1-1-3d4b7d22736b@kernel.org>

Hi Christian,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

url:    https://github.com/intel-lab-lkp/linux/commits/Christian-Brauner/fhandle-relax-open_by_handle_at-permission-checks/20240524-182059
base:   8f6a15f095a63a83b096d9b29aaff4f0fbe6f6e6
patch link:    https://lore.kernel.org/r/20240524-vfs-open_by_handle_at-v1-1-3d4b7d22736b%40kernel.org
patch subject: [PATCH RFC] : fhandle: relax open_by_handle_at() permission checks
config: i386-randconfig-141-20240525 (https://download.01.org/0day-ci/archive/20240526/202405260707.w8Nh9Nv6-lkp@intel.com/config)
compiler: gcc-12 (Ubuntu 12.3.0-9ubuntu2) 12.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202405260707.w8Nh9Nv6-lkp@intel.com/

smatch warnings:
fs/fhandle.c:296 handle_to_path() warn: fd re-used after fget(): 'mountdirfd'

vim +/mountdirfd +296 fs/fhandle.c

becfd1f3754479 Aneesh Kumar K.V    2011-01-29  220  static int handle_to_path(int mountdirfd, struct file_handle __user *ufh,
9ca8b65e411ba7 Christian Brauner   2024-05-24  221  		   struct path *path, unsigned int o_flags)
becfd1f3754479 Aneesh Kumar K.V    2011-01-29  222  {
becfd1f3754479 Aneesh Kumar K.V    2011-01-29  223  	int retval = 0;
becfd1f3754479 Aneesh Kumar K.V    2011-01-29  224  	struct file_handle f_handle;
becfd1f3754479 Aneesh Kumar K.V    2011-01-29  225  	struct file_handle *handle = NULL;
9ca8b65e411ba7 Christian Brauner   2024-05-24  226  	struct handle_to_path_ctx ctx = {};
9ca8b65e411ba7 Christian Brauner   2024-05-24  227  
9ca8b65e411ba7 Christian Brauner   2024-05-24  228  	retval = get_path_from_fd(mountdirfd, &ctx.root);
                                                                                  ^^^^^^^^^^
fd used here.

9ca8b65e411ba7 Christian Brauner   2024-05-24  229  	if (retval)
9ca8b65e411ba7 Christian Brauner   2024-05-24  230  		goto out_err;
becfd1f3754479 Aneesh Kumar K.V    2011-01-29  231  
9ca8b65e411ba7 Christian Brauner   2024-05-24  232  	if (!capable(CAP_DAC_READ_SEARCH)) {
becfd1f3754479 Aneesh Kumar K.V    2011-01-29  233  		/*
9ca8b65e411ba7 Christian Brauner   2024-05-24  234  		 * Allow relaxed permissions of file handles if the caller has
9ca8b65e411ba7 Christian Brauner   2024-05-24  235  		 * the ability to mount the filesystem or create a bind-mount
9ca8b65e411ba7 Christian Brauner   2024-05-24  236  		 * of the provided @mountdirfd.
9ca8b65e411ba7 Christian Brauner   2024-05-24  237  		 *
9ca8b65e411ba7 Christian Brauner   2024-05-24  238  		 * In both cases the caller may be able to get an unobstructed
9ca8b65e411ba7 Christian Brauner   2024-05-24  239  		 * way to the encoded file handle. If the caller is only able
9ca8b65e411ba7 Christian Brauner   2024-05-24  240  		 * to create a bind-mount we need to verify that there are no
9ca8b65e411ba7 Christian Brauner   2024-05-24  241  		 * locked mounts on top of it that could prevent us from
9ca8b65e411ba7 Christian Brauner   2024-05-24  242  		 * getting to the encoded file.
9ca8b65e411ba7 Christian Brauner   2024-05-24  243  		 *
9ca8b65e411ba7 Christian Brauner   2024-05-24  244  		 * In principle, locked mounts can prevent the caller from
9ca8b65e411ba7 Christian Brauner   2024-05-24  245  		 * mounting the filesystem but that only applies to procfs and
9ca8b65e411ba7 Christian Brauner   2024-05-24  246  		 * sysfs neither of which support decoding file handles.
9ca8b65e411ba7 Christian Brauner   2024-05-24  247  		 *
9ca8b65e411ba7 Christian Brauner   2024-05-24  248  		 * This is currently restricted to O_DIRECTORY to provide a
9ca8b65e411ba7 Christian Brauner   2024-05-24  249  		 * deterministic API that avoids a confusing api in the face of
9ca8b65e411ba7 Christian Brauner   2024-05-24  250  		 * disconnected non-dir dentries.
becfd1f3754479 Aneesh Kumar K.V    2011-01-29  251  		 */
9ca8b65e411ba7 Christian Brauner   2024-05-24  252  
becfd1f3754479 Aneesh Kumar K.V    2011-01-29  253  		retval = -EPERM;
9ca8b65e411ba7 Christian Brauner   2024-05-24  254  		if (!(o_flags & O_DIRECTORY))
9ca8b65e411ba7 Christian Brauner   2024-05-24  255  			goto out_path;
9ca8b65e411ba7 Christian Brauner   2024-05-24  256  
9ca8b65e411ba7 Christian Brauner   2024-05-24  257  		if (ns_capable(ctx.root.mnt->mnt_sb->s_user_ns, CAP_SYS_ADMIN))
9ca8b65e411ba7 Christian Brauner   2024-05-24  258  			ctx.flags = HANDLE_CHECK_PERMS;
9ca8b65e411ba7 Christian Brauner   2024-05-24  259  		else if (ns_capable(real_mount(ctx.root.mnt)->mnt_ns->user_ns, CAP_SYS_ADMIN) &&
9ca8b65e411ba7 Christian Brauner   2024-05-24  260  			   !has_locked_children(real_mount(ctx.root.mnt), ctx.root.dentry))
9ca8b65e411ba7 Christian Brauner   2024-05-24  261  			ctx.flags = HANDLE_CHECK_PERMS | HANDLE_CHECK_SUBTREE;
9ca8b65e411ba7 Christian Brauner   2024-05-24  262  		else
9ca8b65e411ba7 Christian Brauner   2024-05-24  263  			goto out_path;
9ca8b65e411ba7 Christian Brauner   2024-05-24  264  
9ca8b65e411ba7 Christian Brauner   2024-05-24  265  		/* Are we able to override DAC permissions? */
9ca8b65e411ba7 Christian Brauner   2024-05-24  266  		if (!ns_capable(current_user_ns(), CAP_DAC_READ_SEARCH))
9ca8b65e411ba7 Christian Brauner   2024-05-24  267  			goto out_path;
9ca8b65e411ba7 Christian Brauner   2024-05-24  268  
9ca8b65e411ba7 Christian Brauner   2024-05-24  269  		ctx.directory = true;
becfd1f3754479 Aneesh Kumar K.V    2011-01-29  270  	}
9ca8b65e411ba7 Christian Brauner   2024-05-24  271  
becfd1f3754479 Aneesh Kumar K.V    2011-01-29  272  	if (copy_from_user(&f_handle, ufh, sizeof(struct file_handle))) {
becfd1f3754479 Aneesh Kumar K.V    2011-01-29  273  		retval = -EFAULT;
9ca8b65e411ba7 Christian Brauner   2024-05-24  274  		goto out_path;
becfd1f3754479 Aneesh Kumar K.V    2011-01-29  275  	}
becfd1f3754479 Aneesh Kumar K.V    2011-01-29  276  	if ((f_handle.handle_bytes > MAX_HANDLE_SZ) ||
becfd1f3754479 Aneesh Kumar K.V    2011-01-29  277  	    (f_handle.handle_bytes == 0)) {
becfd1f3754479 Aneesh Kumar K.V    2011-01-29  278  		retval = -EINVAL;
9ca8b65e411ba7 Christian Brauner   2024-05-24  279  		goto out_path;
becfd1f3754479 Aneesh Kumar K.V    2011-01-29  280  	}
68d6f4f3fbd9b1 Gustavo A. R. Silva 2024-03-25  281  	handle = kmalloc(struct_size(handle, f_handle, f_handle.handle_bytes),
becfd1f3754479 Aneesh Kumar K.V    2011-01-29  282  			 GFP_KERNEL);
becfd1f3754479 Aneesh Kumar K.V    2011-01-29  283  	if (!handle) {
becfd1f3754479 Aneesh Kumar K.V    2011-01-29  284  		retval = -ENOMEM;
9ca8b65e411ba7 Christian Brauner   2024-05-24  285  		goto out_path;
becfd1f3754479 Aneesh Kumar K.V    2011-01-29  286  	}
becfd1f3754479 Aneesh Kumar K.V    2011-01-29  287  	/* copy the full handle */
161f873b89136e Sasha Levin         2015-01-28  288  	*handle = f_handle;
161f873b89136e Sasha Levin         2015-01-28  289  	if (copy_from_user(&handle->f_handle,
161f873b89136e Sasha Levin         2015-01-28  290  			   &ufh->f_handle,
becfd1f3754479 Aneesh Kumar K.V    2011-01-29  291  			   f_handle.handle_bytes)) {
becfd1f3754479 Aneesh Kumar K.V    2011-01-29  292  		retval = -EFAULT;
becfd1f3754479 Aneesh Kumar K.V    2011-01-29  293  		goto out_handle;
becfd1f3754479 Aneesh Kumar K.V    2011-01-29  294  	}
becfd1f3754479 Aneesh Kumar K.V    2011-01-29  295  
9ca8b65e411ba7 Christian Brauner   2024-05-24 @296  	retval = do_handle_to_path(mountdirfd, handle, path, &ctx);
                                                                                   ^^^^^^^^^^
re-used here.  The fd could point to different files for each fget().

9ca8b65e411ba7 Christian Brauner   2024-05-24  297  	if (retval)
9ca8b65e411ba7 Christian Brauner   2024-05-24  298  		goto out_handle;
becfd1f3754479 Aneesh Kumar K.V    2011-01-29  299  
becfd1f3754479 Aneesh Kumar K.V    2011-01-29  300  out_handle:
becfd1f3754479 Aneesh Kumar K.V    2011-01-29  301  	kfree(handle);
9ca8b65e411ba7 Christian Brauner   2024-05-24  302  out_path:
9ca8b65e411ba7 Christian Brauner   2024-05-24  303  	path_put(&ctx.root);
becfd1f3754479 Aneesh Kumar K.V    2011-01-29  304  out_err:
becfd1f3754479 Aneesh Kumar K.V    2011-01-29  305  	return retval;
becfd1f3754479 Aneesh Kumar K.V    2011-01-29  306  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

