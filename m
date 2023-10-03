Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 820F9D506
	for <oe-kbuild-all@lists.linux.dev>; Tue,  3 Oct 2023 08:54:18 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-406618d080eso6561765e9.2
        for <oe-kbuild-all@lists.linux.dev>; Tue, 03 Oct 2023 01:54:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696323256; x=1696928056; darn=lists.linux.dev;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DMBF6CYv/Ij0N24iNy1D3Ro9xhDGvt8mVDekKClPklY=;
        b=c3iPSB4fi4pANILFQEBznvTL4vuJ01pBpqAKxLbcQ6+rMfzTTWutdyLgv2wNIp1eM4
         2aunu7C8VX/szPiGSG53HXVac4u0VVCqKVxcj2ocnNVx9kqNR84OeANeWji6601WQQog
         gMXKvjz3R/dvuto37rKcDBTZIHI6oOUZqdunAvl4og+EL5eOwkn2lz8bEFOF1ltje5pk
         dlkFDhwmN/zWaJ7FJIMc5y8VMQqKrwhhaWLRRMFJIk6RE8M1z8CqVFAPLLP0E7NFBy2X
         Im34OWlqOyiTA1tZ0AQpgeE7cn/XQ39r35q6iGFLVzVidsa1OgpxrNDE8laNdqgHBUvu
         ECjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696323256; x=1696928056;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DMBF6CYv/Ij0N24iNy1D3Ro9xhDGvt8mVDekKClPklY=;
        b=gkL3dM3dWVUhudr2ZZqdsLPdwNHTYA1gO0kf3yzZsqHRkw27N20uXzn97OwHvqeoJu
         9JikwwFsBCCeal53KC2JXqKiPalTmzY1MFebyUEdekmsaSN3m6/WT3waiRayc+oZX+Mt
         xjbZrKXl2RvVTOkXGBnNImrlRO/QKKXzfEV4vAMXfHQomZIyevgW0UhJKpVkCdveoNOc
         RCWdocorlnMnE6JcP2o6JkH1TrsSn438EcDES/HvXpJn5PBK98NOiO8+kGmKmbtir1zI
         tdQigvBklnN8u/jb30NtPvbrdgEE/VIiO45Qb613FbP7gKHpS+vJfSWHUuoPLxgNn9cB
         e86Q==
X-Gm-Message-State: AOJu0YzsAAT2+5YjLjbIyoNhJJmboUBGtPVt/Rt7cL5SjFo1UIzU+It0
	azH4uuiSS750w/STeNskVOvN5A==
X-Google-Smtp-Source: AGHT+IFhwd3cGvrHeY4f/x4a+od0nlW+pzGUHUlr30eX3ZoH56Y2bkm3f8dsAUKIPk6FTODm19vusg==
X-Received: by 2002:a7b:c3c1:0:b0:404:7670:90b8 with SMTP id t1-20020a7bc3c1000000b00404767090b8mr12175904wmj.27.1696323256592;
        Tue, 03 Oct 2023 01:54:16 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id x23-20020a05600c21d700b004051f8d6207sm767778wmj.6.2023.10.03.01.54.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Oct 2023 01:54:15 -0700 (PDT)
Date: Tue, 3 Oct 2023 11:54:13 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	Christoph =?iso-8859-1?Q?B=F6hmwalder?= <christoph.boehmwalder@linbit.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Jens Axboe <axboe@kernel.dk>
Subject: drivers/block/drbd/drbd_worker.c:588 make_resync_request() warn:
 variable dereferenced before check 'peer_device' (see line 587)
Message-ID: <ace247b3-1a4f-43bb-a0ca-49665a1bb410@kadam.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ce36c8b149873b50f2a4b9818eb3dcdd74ddd5a3
commit: 0d11f3cf279c5ad20a41f29242f170ba3c02f2da drbd: Pass a peer device to the resync and online verify functions
config: x86_64-randconfig-161-20231003 (https://download.01.org/0day-ci/archive/20231003/202310030935.6F0FaCJy-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231003/202310030935.6F0FaCJy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202310030935.6F0FaCJy-lkp@intel.com/

smatch warnings:
drivers/block/drbd/drbd_worker.c:588 make_resync_request() warn: variable dereferenced before check 'peer_device' (see line 587)

vim +/peer_device +588 drivers/block/drbd/drbd_worker.c

0d11f3cf279c5a Christoph Böhmwalder 2023-03-30  585  static int make_resync_request(struct drbd_peer_device *const peer_device, int cancel)
b411b3637fa71f Philipp Reisner      2009-09-25  586  {
0d11f3cf279c5a Christoph Böhmwalder 2023-03-30 @587  	struct drbd_device *const device = peer_device->device;
                                                                                           ^^^^^^^^^^^^^^^^^^^^
Dereference

44a4d551846b8c Lars Ellenberg       2013-11-22 @588  	struct drbd_connection *const connection = peer_device ? peer_device->connection : NULL;
                                                                                                   ^^^^^^^^^^^
Checked too late.  The zero day bot sent this warning earlier and I try
not to resend warnings but no one responded to the first one.  The
peer_device pointer comes from a list_first_entry_or_null() so that
suggests it can be NULL.

b411b3637fa71f Philipp Reisner      2009-09-25  589  	unsigned long bit;
b411b3637fa71f Philipp Reisner      2009-09-25  590  	sector_t sector;
155bd9d1abd604 Christoph Hellwig    2020-09-25  591  	const sector_t capacity = get_capacity(device->vdisk);
1816a2b47afae8 Lars Ellenberg       2010-11-11  592  	int max_bio_size;
e65f440d474d7d Lars Ellenberg       2010-11-05  593  	int number, rollback_i, size;
506afb6248af57 Lars Ellenberg       2014-01-31  594  	int align, requeue = 0;
0f0601f4ea2f53 Lars Ellenberg       2010-08-11  595  	int i = 0;
92d94ae66aebda Philipp Reisner      2016-06-14  596  	int discard_granularity = 0;
b411b3637fa71f Philipp Reisner      2009-09-25  597  
b411b3637fa71f Philipp Reisner      2009-09-25  598  	if (unlikely(cancel))
99920dc5c5fe52 Andreas Gruenbacher  2011-03-16  599  		return 0;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

