Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 779E6271450
	for <oe-kbuild-all@lists.linux.dev>; Mon, 19 Jan 2026 06:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768804801; cv=none; b=dk0YYt3IXgHi72/j/Hk26Rm9OHG/9FhoMfHsHcj/bP62KL6Vze1tZYTJmbxFIoct5/2ALYWA/0P/D2anDSka3c1/zq/ZvGyYV4EPYVC4QE26Ykx7kV6Phu13YwfTKA9IGs0dhCdfvwq6NVHneb6jvtquxeqQXAdqAuRmDrzDZV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768804801; c=relaxed/simple;
	bh=YE5jezai2biwr3Gnu5tpda+uRI0xIpqVr5jQ76BFhaQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=GAD7iwJuaMVRWtO2CYaRsqjhgnzLv/Wtp3bWKwIuWhhcCKXwYoyWrTT3KGSVBXjieQVN8FViNE0vjcFuWkIDKJrJ0Q+AuZhokFSgVdf7Ykk4kmJ4KbfG85qPsq05zyxm21BYL2k4Hfk4zaoXLu+N+n682JkMLi3syxUbuxVnvsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=B0yvjbZN; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="B0yvjbZN"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-47ee2715254so17463655e9.3
        for <oe-kbuild-all@lists.linux.dev>; Sun, 18 Jan 2026 22:39:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768804798; x=1769409598; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Dhpuhf8aqRruGu7L/fSfGH0BgTbK0i1Gv5JjSOJHbPQ=;
        b=B0yvjbZNRbrEsjtxkJ6eKib1MdfyNMvYzh9GfoskWvgb2wd9F9EeSKsuP0XwJ9u+2S
         Gapr9RT3dV495Ilcg9ltZ2BuEt/HZAGszWX2ye3edIMzhp6/as2lUyPcDph+YJYJxZ4E
         pJ/f6rtURrpbQw5LmpyIrsDEZyrw56s5ZITzZ/0nlzUksdCymvRNMJjw5tnjYlPtZ6dm
         wV3HKJY2WTkdTCnfJxjaiEeFhNSC4KdhQBSkDyqz3u8l1LK00GCeVxNl+WqSALjcLvSE
         piH/44H8N4W6Be1B6SAKg8sAG3BUtbnDqkwl7I2JgmON5f2Z4AsdUOMJQ/4tcfkperXb
         yaGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768804798; x=1769409598;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dhpuhf8aqRruGu7L/fSfGH0BgTbK0i1Gv5JjSOJHbPQ=;
        b=X6T7aJH8ZTSQbUOdF8Pzph6kNRQjNtXrWYjHYHE/ZMEsBP/Fk+FW8X+6bDcAmNthJt
         ZYjbRP+xtkYMVri/fL17qLL0lXCTQrhsAKMTKN/RG7LmotJMopSguTTOV7fZKK1Ww37W
         kV3QtC4DBaqi7qsJB8AZyLl848bSSsJ0AITTJZjR2flDX30Vwj7kgfHlZtTj4ce9y11t
         1Lez72olj3v2pyeKDSpzS89abpqeQiR+9wD4p9AYaeUU1AN6q9Qb1cvMntNZZyfIhCvk
         puPp/HwiveNTO5aX9LlmX8cY5+XQKExdTIon1l7vVcjG+ID0G78Nzrn0CvEG09WGHIT3
         BEtQ==
X-Forwarded-Encrypted: i=1; AJvYcCWatB3ht/VFXXmMTVKRzbFoP63OvNWp3mRfBefrG6gIcbbDtMleqk3eDHN1To0QamrLM1/NkJZnKpXUSKMk@lists.linux.dev
X-Gm-Message-State: AOJu0Yw16ccrgjarNno5pV8XmM9HyBl6ZmKyPrhrDTWKie9BOZnRE+/f
	3I/dS9DxyGdpsUNMHuHHwlqCsUo7bUuw+r4ZuUBPhoottn8lK2NPjJPowHMg2Ke84Ec=
X-Gm-Gg: AY/fxX7pU6bSfJZMqfJypos0YvCjSefU01X6hP7POiYrNLvpvOFaftW8GVee0IPVh+z
	BLXDmrcGJnVtClme9YazRlDaMM/d/OqOeShJDQ4NCYNpB6e1UqYn/Jt9wOsOJP52I+Soec5YoEG
	8K6SJj2Q4YEZZuEtTdOsut6nRQhly78LgOw/tx7h2vKbL320waVy6G1Fv1tVHwbY+nZMRGvUXJ0
	EQBSMQSkvIbINcomnh/kuOTGcILmFK6Bq6i5zxe3A6GaovCmORWexGwPHwzoluEaNQ+u9q3v/3P
	FUnopVZKccPVGKjynCrU3oGRcqO1sXvCiBr0IorQCK5p2BO+MOTFHw0VBrRkcrSH3w9U/Kc+9F2
	WCKAwPX1O4ynXJadzZ8Ww5ETHTVk86Kj02Bl7/LAvJu4dISy17NpNlpEtmrc0MUr3aD5cx1TVUC
	9I8lyFSWoABJL6nDnI
X-Received: by 2002:a05:600c:4f8f:b0:477:aed0:f40a with SMTP id 5b1f17b1804b1-4801e33c2a5mr130322625e9.19.1768804797300;
        Sun, 18 Jan 2026 22:39:57 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4801fe3ae95sm77473395e9.4.2026.01.18.22.39.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jan 2026 22:39:56 -0800 (PST)
Date: Mon, 19 Jan 2026 09:39:54 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, fdmanana@kernel.org,
	linux-btrfs@vger.kernel.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] btrfs: use the btrfs_block_group_end() helper everywhere
Message-ID: <202601170636.WsePMV5H-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f7afa4b2c9350b08695cc34cd917dea3bf766bce.1768559305.git.fdmanana@suse.com>

Hi,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/fdmanana-kernel-org/btrfs-use-the-btrfs_block_group_end-helper-everywhere/20260116-183655
base:   https://git.kernel.org/pub/scm/linux/kernel/git/kdave/linux.git for-next
patch link:    https://lore.kernel.org/r/f7afa4b2c9350b08695cc34cd917dea3bf766bce.1768559305.git.fdmanana%40suse.com
patch subject: [PATCH] btrfs: use the btrfs_block_group_end() helper everywhere
config: alpha-randconfig-r072-20260117 (https://download.01.org/0day-ci/archive/20260117/202601170636.WsePMV5H-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 10.5.0
smatch version: v0.5.0-8985-g2614ff1a

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202601170636.WsePMV5H-lkp@intel.com/

New smatch warnings:
fs/btrfs/free-space-cache.c:1207 write_pinned_extent_entries() warn: variable dereferenced before check 'block_group' (see line 1203)

vim +/block_group +1207 fs/btrfs/free-space-cache.c

6701bdb39ceb48 David Sterba    2019-03-20  1196  static noinline_for_stack int write_pinned_extent_entries(
6b45f64172e130 Nikolay Borisov 2020-01-20  1197  			    struct btrfs_trans_handle *trans,
32da5386d9a4fd David Sterba    2019-10-29  1198  			    struct btrfs_block_group *block_group,
4c6d1d85ad89fd Chris Mason     2015-04-06  1199  			    struct btrfs_io_ctl *io_ctl,
d4452bc526c431 Chris Mason     2014-05-19  1200  			    int *entries)
d4452bc526c431 Chris Mason     2014-05-19  1201  {
d4452bc526c431 Chris Mason     2014-05-19  1202  	u64 start, extent_start, extent_end, len;
7fc5a6968403c7 Filipe Manana   2026-01-16 @1203  	const u64 block_group_end = btrfs_block_group_end(block_group);
                                                                                                          ^^^^^^^^^^^^
Dereferenced.

d4452bc526c431 Chris Mason     2014-05-19  1204  	struct extent_io_tree *unpin = NULL;
d4452bc526c431 Chris Mason     2014-05-19  1205  	int ret;
43be21462d8c26 Josef Bacik     2011-04-01  1206  
5349d6c3ffead2 Miao Xie        2014-06-19 @1207  	if (!block_group)
                                                             ^^^^^^^^^^^
Too late.

5349d6c3ffead2 Miao Xie        2014-06-19  1208  		return 0;
5349d6c3ffead2 Miao Xie        2014-06-19  1209  
43be21462d8c26 Josef Bacik     2011-04-01  1210  	/*
43be21462d8c26 Josef Bacik     2011-04-01  1211  	 * We want to add any pinned extents to our free space cache
43be21462d8c26 Josef Bacik     2011-04-01  1212  	 * so we don't leak the space

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

