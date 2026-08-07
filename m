Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 532A830BF6B
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Aug 2026 16:55:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786121714; cv=none; b=D8b/yHOlpvcJEAUe8m9rNSupoGGZoBWt7ZzfiODcDGEo3MJiY7+D1vGObXaF9rUI97IRhsydImsjAbPvalmhnLKXFOCg/Gwxq7PPHnTmL/HNJO+FHOqxVitVtTHk4RVTWhlk4jJ45f0OWx/9aL25g7wF63M8ZTFh8djRlKDmbXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786121714; c=relaxed/simple;
	bh=w44gWSxPdQjrl4Q8P7ErabLUzfDafLFgd5adwGSC7hI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FRDgWmGmXJW9ceNy/zMQYW8snFHWEylwwWvdJudpOvYM8xJRSX/Is4HfXO5rsAKLTO4AVruiHeDUoJy6jJx1x4ZAC833zZZ/JUuyGFoUkZHnaPgtr8TsxRKzxE0wU4nbqrXEX5+njH/htcHLj9m1XP3DEB+twIyzE9IIfGeXsXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Os6JUhnD; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Os6JUhnD"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-51c2a76536bso32151811cf.1
        for <oe-kbuild-all@lists.linux.dev>; Fri, 07 Aug 2026 09:55:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786121712; x=1786726512; darn=lists.linux.dev;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s/FeEsrWnUI92U6c0JlV2MTC2xQj+SJZ7T+hkvEGMHU=;
        b=Os6JUhnDYy0DwNhN6VTMUS/Gv+kfjTnQl4LqCP/VwMzrcisjtISq69TANGKeJO3Gos
         Iu1wQhPpYkEZW95sTk7BaxastzP12IUwh5FtArZ9TOLgbgOHuYwzA3RDuXoZgU/mMSlx
         71D8XdOc0N+tHj+EZAgBJfdH1575cKxmJQykRgYQm9pU29ETIEifuGo0mxtzQAew5eu3
         nvuXpNIs9ws1LNAkPkSkeq5iiLodz1qzkjOKr8vw5UtGSwGkx5cNudG95zT1YK/nLrOp
         F2iNjHwywoDZBzVft3Aq4Rg0RqDbzhmCRrQ3F2mWvTN8iBpqUvkA8+Q1maZL0FdHbkLN
         nJww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786121712; x=1786726512;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s/FeEsrWnUI92U6c0JlV2MTC2xQj+SJZ7T+hkvEGMHU=;
        b=Qb1L8kFZ7aqEcnNRlSC2O7hpmXU/DLb627Ox1z9R+QJQjm/fPB08D9mx6kfG6mAxa8
         Ba+oEVDSapJU3PzVxgJi1CZ2/U3n9MLoqKJ1EBtgXy/VYtbzhny0ZRk63QI2CSNghAMO
         6+3r3PwYJcOFfIHyWuvrn9khZ3bVDillGJOeAI8IfIcC612DWEINxb1XrTYeaFUKAx9d
         PFl7ECt4Ve2UKp0bZ8CRMJlimZ3MbUbrcDNXlGq5Xhrq00Qc2VS3wMp5nfYaWZNWpXUo
         jqc3tE3Pg8tL+rwlE9T4an6EbvLTPVegF1y0GlYmkv1OQGzTk+gksoEVGfa3vjQvf0LV
         Dhpw==
X-Forwarded-Encrypted: i=1; AHgh+RoVs6GILGZonbZ6RK1Hn/01ZYzDIkZmY3+pdr4JLbBJMwZ9HnjYvV3/roIbcSuW9O6M+EAt+As9rPAGZRiw@lists.linux.dev
X-Gm-Message-State: AOJu0Yw8+EULe3ZJeg+qoy/YY/6iOAMtXEXTmJZdXso71dYCkW1lEUjG
	pCFxSna0KU+gNT5Z+lAJb0WqrFWtSwQrTXdE2FWM6OPhwurQ7j3S4qOp
X-Gm-Gg: AR+sD1002jGNUzqGCYpflEdJkaiSeZTajMWXy3XgZWsKp8uBAlivWEW/WmdU2gy4k17
	h2kBUhn4BdKYYp/lbpqAf3O25FjdxO3bcnRbysvOlXgC80pxVDsGqMQbnmCYRQPhHuLtNsMDytm
	I9cdYYoAcpW0fvkxuX8MmlUjx/bsdK0GFDsbCMgYWYBFwjXLtSZagCvn2GT0eg4h1ZpvIC8BWHc
	TlPuiwDw2Ep7wzV9B7/HFlr40Fsx1rwUwcByxfX5A5JKzHmDr+Gk5+I/hX8tJzH49JASjZ/hZfK
	Vez7OYOPC8/Be1lXxarrtpq3jC4NG1oWTsyCkz3c351zBj1NDpLbxTz883EDOOxpZVz8zSAUnYL
	19xSgkAypUrpGFFnGqYpJ7bQt1mVYbscKURclIiyPEN+vAhKF84WfBVrNRK1I5PkYmK+6WCeKQO
	DZc0acJgpKu0jZnti4CZxgaVztcO+NGb07xLSvfSZsZzi4TAggJsx/gkpOKKAzCeeBlQ==
X-Received: by 2002:a05:622a:a0f:b0:50e:635b:5579 with SMTP id d75a77b69052e-52d20975cb7mr25961661cf.19.1786121712089;
        Fri, 07 Aug 2026 09:55:12 -0700 (PDT)
Received: from localhost ([172.216.11.43])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-52d16335bb4sm16036641cf.2.2026.08.07.09.55.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 09:55:11 -0700 (PDT)
Date: Fri, 7 Aug 2026 19:55:02 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Eli Billauer <eli.billauer@gmail.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: drivers/char/xillybus/xillybus_class.c:230 xillybus_find_inode()
 warn: variable dereferenced before check 'inode' (see line 226)
Message-ID: <202608072246.Ee6OOcT6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel-lab-lkp/linux/commits/Eli-Billauer/char-xillybus-Improve-control-of-execution-flow-with-mutexes/20260806-033404
head:   d05c024c9354aabd2ea64be46e6fccbf24ba33cd
commit: 16edb90c39a5645b3803be32b2b77476efae2402 char: xillybus: Add defensive sanity checks
config: i386-randconfig-141 (https://download.01.org/0day-ci/archive/20260807/202608072246.Ee6OOcT6-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202608072246.Ee6OOcT6-lkp@intel.com/

smatch warnings:
drivers/char/xillybus/xillybus_class.c:230 xillybus_find_inode() warn: variable dereferenced before check 'inode' (see line 226)

vim +/inode +230 drivers/char/xillybus/xillybus_class.c

8cb5d216ab3365 Eli Billauer  2021-05-26  223  int xillybus_find_inode(struct inode *inode,
8cb5d216ab3365 Eli Billauer  2021-05-26  224  			void **private_data, int *index)
8cb5d216ab3365 Eli Billauer  2021-05-26  225  {
8cb5d216ab3365 Eli Billauer  2021-05-26 @226  	int minor = iminor(inode);
8cb5d216ab3365 Eli Billauer  2021-05-26  227  	int major = imajor(inode);
                                                                   ^^^^^
Unchecked dereferences

4834f9898c7301 Jakob Koschel 2022-03-24  228  	struct xilly_unit *unit = NULL, *iter;
8cb5d216ab3365 Eli Billauer  2021-05-26  229  
16edb90c39a564 Eli Billauer  2026-06-30 @230  	if (!inode || !private_data || !index)
                                                    ^^^^^^
Checked too late.

16edb90c39a564 Eli Billauer  2026-06-30  231  		return -ENODEV;
16edb90c39a564 Eli Billauer  2026-06-30  232  
8cb5d216ab3365 Eli Billauer  2021-05-26  233  	mutex_lock(&unit_mutex);
8cb5d216ab3365 Eli Billauer  2021-05-26  234  
4834f9898c7301 Jakob Koschel 2022-03-24  235  	list_for_each_entry(iter, &unit_list, list_entry)

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

