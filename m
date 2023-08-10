Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4DB5EBD
	for <oe-kbuild-all@lists.linux.dev>; Thu, 10 Aug 2023 05:07:32 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-317c3ac7339so499595f8f.0
        for <oe-kbuild-all@lists.linux.dev>; Wed, 09 Aug 2023 22:07:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691644050; x=1692248850;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9zZSTt++qSivcx2W68Ryg2gpTfnYZRO2cI6Dv69Y8RY=;
        b=QBncGCc6Iqrj5AJ2rBSBb/3UUOTYOwUA3c1KTruf5S5qHI/Zh4RZAgE+42RJzYo1XG
         kVvzyPxxID28pBwW6bIh5F6uup2kNuTiwUgyWVQR7cuccIoJjLW5Nk50mUo/eHpfQYlS
         K6URHuP7/Yoe3A0VzS06z3uakc8QzcCMWDg/zfk4bb4WnPuGIizb9CmlJkPfnDaQkQ+G
         +aQq/Wt9JSlzxqpc6xgU26yPND1xPssubpr4cvf4YmZdMgGIAO3HoxpuZDrwd9+qmpux
         9elzeBuIrJm0h4eryG7JhotwV7MPOSRFLlkz0ea8qpYYqx3J1FOjOntvMgsUazaC9JVF
         TPjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691644050; x=1692248850;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9zZSTt++qSivcx2W68Ryg2gpTfnYZRO2cI6Dv69Y8RY=;
        b=XWr8ARG6zo1VrQ4/WW6qT/JSjnzPlYXfVU2aBRBy1rK7us66GpMXZSaJpMnVjzCcyE
         90tpfd+ZYglgHLS5AuhDL6UuKHHHVniLHSuXjpZ2Eu+FOr9RCF73fUBWY2GzDVhoFBts
         IX4LFsMXv5kwI7l53srn7wjcUL+FQEPpEaryRHUhKxKRIl8+g2b5bGCC6g2KRyho9g5V
         LSJ+KzeQ42FoNrRkn+b2+7NiowL3MEdTMA4OFnZ+TvVvVbsjK51lrWD8RyZhayhpa5U+
         MQYOC690g2WKN7CJaIp0uKozq6ZgN76iyld53+S2T3wMxdcO8x47VwiPCGpiPHXyrxtg
         0F+w==
X-Gm-Message-State: AOJu0Yw3jbg4bl2OUUj7ugrgjj8DB18aYyg5V7l2WFjb9Gk7MDWDReyG
	4oHTHO6iI8B/CXX1tUxGnMs8lNZ6w9+fywLjSmw=
X-Google-Smtp-Source: AGHT+IH8ujwUirEkH1+JKpKZT76olHkm+iW5IL8ewnmszrlDKfrF9RTCCMx0hsa+xwzb889r2u/0iQ==
X-Received: by 2002:a5d:60ce:0:b0:313:f399:6cea with SMTP id x14-20020a5d60ce000000b00313f3996ceamr1048069wrt.4.1691644050674;
        Wed, 09 Aug 2023 22:07:30 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id h1-20020adffd41000000b0030ae499da59sm781409wrs.111.2023.08.09.22.07.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Aug 2023 22:07:30 -0700 (PDT)
Date: Thu, 10 Aug 2023 08:07:27 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Andreas Hindborg <a.hindborg@samsung.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Jens Axboe <axboe@kernel.dk>, Ming Lei <ming.lei@redhat.com>
Subject: [linux-next:master 8194/8441] drivers/block/ublk_drv.c:445
 ublk_setup_iod_zoned() warn: signedness bug returning '(-95)'
Message-ID: <ea982bd0-5375-4bcd-bb59-936070bf46be@kadam.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   21ef7b1e17d039053edaeaf41142423810572741
commit: 29802d7ca33bc0a75c9da2a143eeed4f9e99fca4 [8194/8441] ublk: enable zoned storage support
config: s390-randconfig-m041-20230809 (https://download.01.org/0day-ci/archive/20230810/202308100201.TCRhgdvN-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230810/202308100201.TCRhgdvN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202308100201.TCRhgdvN-lkp@intel.com/

New smatch warnings:
drivers/block/ublk_drv.c:445 ublk_setup_iod_zoned() warn: signedness bug returning '(-95)'

Old smatch warnings:
drivers/block/ublk_drv.c:963 ublk_setup_iod() warn: signedness bug returning '(-5)'
drivers/block/ublk_drv.c:1404 ublk_commit_completion() warn: variable dereferenced before check 'req' (see line 1401)

vim +445 drivers/block/ublk_drv.c

29802d7ca33bc0 Andreas Hindborg 2023-08-04  442  static blk_status_t ublk_setup_iod_zoned(struct ublk_queue *ubq,
29802d7ca33bc0 Andreas Hindborg 2023-08-04  443  					 struct request *req)
29802d7ca33bc0 Andreas Hindborg 2023-08-04  444  {
29802d7ca33bc0 Andreas Hindborg 2023-08-04 @445  	return -EOPNOTSUPP;

blk_status_t can either be a u32 or a u8 but for this warning to trigger
it must be a u8 in this case.

29802d7ca33bc0 Andreas Hindborg 2023-08-04  446  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

