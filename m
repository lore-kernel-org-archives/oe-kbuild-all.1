Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34FEF1FA8
	for <oe-kbuild-all@lists.linux.dev>; Mon, 12 Jun 2023 05:07:34 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-30aebe2602fso2444023f8f.3
        for <oe-kbuild-all@lists.linux.dev>; Sun, 11 Jun 2023 22:07:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686546453; x=1689138453;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=s9neQOA6YYbjk55k05FDYX9wQVIjujMf9gKj3ORCnhk=;
        b=yivWcaPFZqZRowossRYHnn7ATg0PoVl4L8ftWvB01MA7sZwPrw3daOsYguetC6t+8D
         yQo3e3WchXEeKrEZbG54uHfSyg2zWdt2jBDWg83xRzfZub9tQdZkdOsk/HRzInTTk1au
         5ftiN3B8EILPCnZFb2eFaZbFj8enWIgfZNRp4HLn7WLOpxKfgHCKGjkqC/RMOHvD5uMr
         unfOJ7uyhXcurMdGjp2E0Y42bz1Z9skzRrYUj3G7mfrfiaDI0SyWUAV9SqvjuHw4/Yam
         VS5dgGR6tLcDiC0/elPrQykG9BOL79pcN69oDfE60NX4EoiJgNFZsxCRLbLbX+ylHoiY
         hWzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686546453; x=1689138453;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=s9neQOA6YYbjk55k05FDYX9wQVIjujMf9gKj3ORCnhk=;
        b=dDOweJOjypJz4QoJ5KoF41zNZJ/53/Vk4IydVEQprqUHYmYSrCR9oRf2rfPg7Wh/0i
         7awpeac/YYW25EhnM5GLla8X8hrsa8dA2CZ4Ky5S2t6ElNuKBoQITp/Hga1OlzBEJQ1l
         O5IeDHRYpn+tE/+7Qb7xLVOkW60MGSN7WBYF2rs6aXOvrcJHcitZgZddXIJOric0ETjv
         cPcj7Yw8lDnDRPRjYFZOvNvRqlxAXl4oN+6ScZWwUrtjZhJ2ZWqKyRUCV0zgZAaXZjAH
         zg3a4Ghqnbby7DU7bXND6fG5u0D8z4Ji/TuBEkdtdOdgJJtUudNm9hjvceSFGtlBnTFr
         +rQw==
X-Gm-Message-State: AC+VfDzkCuk8fW/cLHWwxbiT6EO7cxhFClwvdO0wfVnepjRd2oi16l+r
	No0snj9TylERztGtN0e6kEGbaw==
X-Google-Smtp-Source: ACHHUZ5F5FO/hevaVym6FBKGuvbYz0PZueEuywoDaG25OlxTDEnl5QRQM9zpwvB8M9wQakMwArKUcg==
X-Received: by 2002:adf:cd05:0:b0:30a:e9a9:a4e4 with SMTP id w5-20020adfcd05000000b0030ae9a9a4e4mr2967483wrm.51.1686546453182;
        Sun, 11 Jun 2023 22:07:33 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id b5-20020adff905000000b0030aedb8156esm11117664wrr.102.2023.06.11.22.07.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jun 2023 22:07:31 -0700 (PDT)
Date: Mon, 12 Jun 2023 08:07:28 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Zheng Wang <zyytlz.wz@163.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, Coly Li <colyli@suse.de>
Subject: [colyli-bcache:for-next 4/7] drivers/md/bcache/btree.c:1511
 btree_gc_rewrite_node() error: 'n' dereferencing possible ERR_PTR()
Message-ID: <bab6966d-3f96-44a0-b666-ddf976179eab@kadam.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

[ This patch didn't introduce the bug, it just make the code more
  clear for static analysis so that's why the warning is printed -dan ]

Hi Zheng,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/colyli/linux-bcache.git for-next
head:   313c29cf50657b993b76a2df466b9c09ac8f3d83
commit: 71e765f4f8e55289201daa575331e011f80c0b12 [4/7] bcache: Remove some unnecessary NULL point check for the return value of __bch_btree_node_alloc-related pointer
config: parisc-randconfig-m031-20230608 (https://download.01.org/0day-ci/archive/20230611/202306110753.VR6S20cb-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202306110753.VR6S20cb-lkp@intel.com/

New smatch warnings:
drivers/md/bcache/btree.c:1511 btree_gc_rewrite_node() error: 'n' dereferencing possible ERR_PTR()

Old smatch warnings:
drivers/md/bcache/btree.c:1527 btree_gc_rewrite_node() error: 'n' dereferencing possible ERR_PTR()

vim +/n +1511 drivers/md/bcache/btree.c

0a63b66db566cf Kent Overstreet 2014-03-17  1497  static int btree_gc_rewrite_node(struct btree *b, struct btree_op *op,
0a63b66db566cf Kent Overstreet 2014-03-17  1498  				 struct btree *replace)
0a63b66db566cf Kent Overstreet 2014-03-17  1499  {
0a63b66db566cf Kent Overstreet 2014-03-17  1500  	struct keylist keys;
0a63b66db566cf Kent Overstreet 2014-03-17  1501  	struct btree *n;
0a63b66db566cf Kent Overstreet 2014-03-17  1502  
0a63b66db566cf Kent Overstreet 2014-03-17  1503  	if (btree_check_reserve(b, NULL))
0a63b66db566cf Kent Overstreet 2014-03-17  1504  		return 0;
0a63b66db566cf Kent Overstreet 2014-03-17  1505  
0a63b66db566cf Kent Overstreet 2014-03-17  1506  	n = btree_node_alloc_replacement(replace, NULL);

No checks for error.

0a63b66db566cf Kent Overstreet 2014-03-17  1507  
0a63b66db566cf Kent Overstreet 2014-03-17  1508  	/* recheck reserve after allocating replacement node */
0a63b66db566cf Kent Overstreet 2014-03-17  1509  	if (btree_check_reserve(b, NULL)) {
0a63b66db566cf Kent Overstreet 2014-03-17  1510  		btree_node_free(n);
0a63b66db566cf Kent Overstreet 2014-03-17 @1511  		rw_unlock(true, n);
0a63b66db566cf Kent Overstreet 2014-03-17  1512  		return 0;
0a63b66db566cf Kent Overstreet 2014-03-17  1513  	}
0a63b66db566cf Kent Overstreet 2014-03-17  1514  
0a63b66db566cf Kent Overstreet 2014-03-17  1515  	bch_btree_node_write_sync(n);
0a63b66db566cf Kent Overstreet 2014-03-17  1516  
0a63b66db566cf Kent Overstreet 2014-03-17  1517  	bch_keylist_init(&keys);
0a63b66db566cf Kent Overstreet 2014-03-17  1518  	bch_keylist_add(&keys, &n->key);
0a63b66db566cf Kent Overstreet 2014-03-17  1519  
0a63b66db566cf Kent Overstreet 2014-03-17  1520  	make_btree_freeing_key(replace, keys.top);
0a63b66db566cf Kent Overstreet 2014-03-17  1521  	bch_keylist_push(&keys);
0a63b66db566cf Kent Overstreet 2014-03-17  1522  
0a63b66db566cf Kent Overstreet 2014-03-17  1523  	bch_btree_insert_node(b, op, &keys, NULL, NULL);
0a63b66db566cf Kent Overstreet 2014-03-17  1524  	BUG_ON(!bch_keylist_empty(&keys));
0a63b66db566cf Kent Overstreet 2014-03-17  1525  
0a63b66db566cf Kent Overstreet 2014-03-17  1526  	btree_node_free(replace);
0a63b66db566cf Kent Overstreet 2014-03-17  1527  	rw_unlock(true, n);
0a63b66db566cf Kent Overstreet 2014-03-17  1528  
0a63b66db566cf Kent Overstreet 2014-03-17  1529  	/* Invalidated our iterator */
0a63b66db566cf Kent Overstreet 2014-03-17  1530  	return -EINTR;
0a63b66db566cf Kent Overstreet 2014-03-17  1531  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

