Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FCA82EFD83
	for <oe-kbuild-all@lists.linux.dev>; Thu, 21 Aug 2025 08:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755764499; cv=none; b=lGMv+oqIvx16WVoOlI+QINIfl60zB3mYU1whcTSaSu5GntvQQV9BDWkSOYE8arKXwEpGKcsVOse/uddwePtIAMRREnYM+fYsso9yYl2kqTIzpE7CdcSFbmd/b8YiSdqj34aClmdV3eIR++aqcpozRSSn7Fsg30u+/MhMLNElYQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755764499; c=relaxed/simple;
	bh=JXocULCsBo7/n98cmVoNOqykInxPZnjLVNBTREPdg0Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=k1EEZ+6SM1n6lrgHx9yLOGpJ/WwX8iaAtt+3M63vWJ5pzmy+1O6E9xZjyrrbwory1YpoXWKdQkHEJSLPGeriXs7RCbDLC2VP26gWcG5/UArT6YoHkBHooHtk2kykLG6KmI3dzQx+9PeUXZNbsng+yBas8/mIxHcrcoEyX5iKGBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wDm0un/2; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wDm0un/2"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3b916fda762so799405f8f.0
        for <oe-kbuild-all@lists.linux.dev>; Thu, 21 Aug 2025 01:21:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755764495; x=1756369295; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6F9MVHoGttGvZi9mtKapX8wE+xXVK++WzjAWqNNFy5w=;
        b=wDm0un/2mAX/bkwju2uaf1Kq2Iq5P2faAa+PYhOi5Xsmsi0yFLDauxZbNY4mAUWm8y
         hLucNeKiuW6IelvRwDVP5QvmRmYbLVDJvfACnTZSHWJ8aFM8QpT45x0OjcMugtoqc2OQ
         26qMZ3aSRI/6UD54Y/96AhiloZz3Mi0SrbD8IhtNx2PDPOUx5OL1fvHRiMLZxTTUunhU
         L6+o4FN6eZ1THa2xf1z7VmAfmeJtaIhFfEexxADv4T6VtKPrFoixFhP3ejjUj09ck8um
         iqw0nh7ieJF48DGaqn+VDj1jjV9RKQqoezXT/t5Y227ogv3XIfadhEB4/K6UdAXUmrR4
         ibRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755764495; x=1756369295;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6F9MVHoGttGvZi9mtKapX8wE+xXVK++WzjAWqNNFy5w=;
        b=N0i/sJ2qO02e3dI+ILhvg4u2FoadBWTVHmdvqy7Owy1WFEuT08yVT99V/ihHsaJQdv
         pcaVCczpqL5IneGT0nwayJaQ9XA4Uvw6F7pDXmeR7aAvzJAOSZPJ9w/Z3tbhI7emX9YA
         WwUvE7MydJhDH01UwfvLpJYIeY6fdi93RBrcwmre2hM+GWHh/opv7RWszPsGWBkNIC6n
         sQ6JIpFFRu09OUT+mwYqe4uSQTH4iqk9jHgyD89bSOXg8Q8sCMsGU6s6Q7AQYvvBAh1l
         qctlyyzVmuL5Kq1zd75bSUvRDzi7fpTe4KRO7A8EcVlZUkHr6nMMNNZtM/pSNG/L7zvn
         yOGw==
X-Forwarded-Encrypted: i=1; AJvYcCXlnRVO6kTZbhkGAZqaMuhehR9C4yFR4KFgI7yY5+sRqfd6nlmOragLRa+ubQfD3vjbI5HLdAjCjP7UKuw4@lists.linux.dev
X-Gm-Message-State: AOJu0YzoOobszr0ZnN4Fhe2iw9/1V3J6Pe8hCrLJexz+9QMPzbeSIg3W
	o+DmUVMkjxYcsQHIECF1CrN7DaYMdOZ/nV4EVYzy5KkYq2IkySryfb1VgC76IRWuhGU=
X-Gm-Gg: ASbGnctzhd0cWhdH7XFhl1uDwL1r1b5Xv8BD9VFqh811i2cKikEOo08YQF7ObshMhEl
	abXmtb/eT2p/rFr8sEZQ3Dsod7D0Hb4myRndBrMUZODoBY549O1SkRl1Zj4X7By5A/kTJxwzlsC
	kUHpfm+DN7ylg2sBDcUdMxV4KV6Am0ZxRL3XuJ3EN/5Su1whzbrSJQJtAbZ+JV2etOOtCFDBEoZ
	VqvEWe8j7cA9WeleESm8KXzOrg49tbBSvAdMUZACCKOMJuoflSQsQoo7sE1/qXkBcl9hgbDhK2F
	bYUgElByDSQqBXSb37yA1rDQUkhFAOohFXLOxSEg0b+H+Gy8aWrvH273DlzHPsZWCS3b0zO1N5H
	d22BT17ZV/t6iyWuBLxRM5VYlto4=
X-Google-Smtp-Source: AGHT+IEEH9J16IEfY7X5Ab8U3awn2/tTG/DyRWYmbtluKFWJrwnSi/zTjuUtoKU2yasvK1jGjM/f0A==
X-Received: by 2002:a05:6000:2911:b0:3b7:9d87:9808 with SMTP id ffacd0b85a97d-3c4b0445cbcmr1346807f8f.15.1755764494525;
        Thu, 21 Aug 2025 01:21:34 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3c07487986fsm11782149f8f.1.2025.08.21.01.21.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 01:21:34 -0700 (PDT)
Date: Thu, 21 Aug 2025 11:21:30 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Sun YangKai <sunk67188@gmail.com>,
	linux-btrfs@vger.kernel.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Sun YangKai <sunk67188@gmail.com>
Subject: Re: [PATCH] btrfs: more trivial BTRFS_PATH_AUTO_FREE conversions
Message-ID: <202508211534.QmDKCbTm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250819033819.19826-1-sunk67188@gmail.com>

Hi Sun,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sun-YangKai/btrfs-more-trivial-BTRFS_PATH_AUTO_FREE-conversions/20250819-114252
base:   v6.17-rc2
patch link:    https://lore.kernel.org/r/20250819033819.19826-1-sunk67188%40gmail.com
patch subject: [PATCH] btrfs: more trivial BTRFS_PATH_AUTO_FREE conversions
config: parisc-randconfig-r071-20250821 (https://download.01.org/0day-ci/archive/20250821/202508211534.QmDKCbTm-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 9.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202508211534.QmDKCbTm-lkp@intel.com/

smatch warnings:
fs/btrfs/send.c:931 get_inode_info() warn: missing error code? 'ret'

vim +/ret +931 fs/btrfs/send.c

7e93f6dc11d9128 BingJing Chang  2022-08-12  908  static int get_inode_info(struct btrfs_root *root, u64 ino,
7e93f6dc11d9128 BingJing Chang  2022-08-12  909  			  struct btrfs_inode_info *info)
31db9f7c23fbf7e Alexander Block 2012-07-25  910  {
31db9f7c23fbf7e Alexander Block 2012-07-25  911  	int ret;
c8ce1e5fe626333 Sun YangKai     2025-08-19  912  	BTRFS_PATH_AUTO_FREE(path);
31db9f7c23fbf7e Alexander Block 2012-07-25  913  	struct btrfs_inode_item *ii;
31db9f7c23fbf7e Alexander Block 2012-07-25  914  	struct btrfs_key key;
31db9f7c23fbf7e Alexander Block 2012-07-25  915  
7e93f6dc11d9128 BingJing Chang  2022-08-12  916  	path = alloc_path_for_send();
7e93f6dc11d9128 BingJing Chang  2022-08-12  917  	if (!path)
7e93f6dc11d9128 BingJing Chang  2022-08-12  918  		return -ENOMEM;
7e93f6dc11d9128 BingJing Chang  2022-08-12  919  
31db9f7c23fbf7e Alexander Block 2012-07-25  920  	key.objectid = ino;
31db9f7c23fbf7e Alexander Block 2012-07-25  921  	key.type = BTRFS_INODE_ITEM_KEY;
31db9f7c23fbf7e Alexander Block 2012-07-25  922  	key.offset = 0;
31db9f7c23fbf7e Alexander Block 2012-07-25  923  	ret = btrfs_search_slot(NULL, root, &key, path, 0, 0);
31db9f7c23fbf7e Alexander Block 2012-07-25  924  	if (ret) {
3f8a18cc53bd1be Josef Bacik     2014-03-28  925  		if (ret > 0)
31db9f7c23fbf7e Alexander Block 2012-07-25  926  			ret = -ENOENT;
c8ce1e5fe626333 Sun YangKai     2025-08-19  927  		return ret;
31db9f7c23fbf7e Alexander Block 2012-07-25  928  	}
31db9f7c23fbf7e Alexander Block 2012-07-25  929  
7e93f6dc11d9128 BingJing Chang  2022-08-12  930  	if (!info)
c8ce1e5fe626333 Sun YangKai     2025-08-19 @931  		return ret;

ret is zero, but it should be an error code.

7e93f6dc11d9128 BingJing Chang  2022-08-12  932  
31db9f7c23fbf7e Alexander Block 2012-07-25  933  	ii = btrfs_item_ptr(path->nodes[0], path->slots[0],
31db9f7c23fbf7e Alexander Block 2012-07-25  934  			struct btrfs_inode_item);
7e93f6dc11d9128 BingJing Chang  2022-08-12  935  	info->size = btrfs_inode_size(path->nodes[0], ii);
7e93f6dc11d9128 BingJing Chang  2022-08-12  936  	info->gen = btrfs_inode_generation(path->nodes[0], ii);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

