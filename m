Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E9543BBA0B
	for <oe-kbuild-all@lists.linux.dev>; Fri, 16 Oct 2026 07:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792137535; cv=none; b=nYFUMUShoVlt095yPTagoINKgmVe+rLmuR4XrzmvGjT3lmQDww6bnyXA+N9gjFqFAX4k2srWpULzTshC0SNjD4jVsvkwgCxK48qctoV8PGGtU8NSJQBMzQmyX2Tgj3QRWlTolIN7jv2L26oQqi0jG+UniY1wFJVKo6hcNFShlS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792137535; c=relaxed/simple;
	bh=jCRKt2XU89OMC7gBAdYHQaXDL9OB2wG2XOum1jG4I6g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CMtmhleWTzkTcIwt2VdH0XrASzEfQ9l27qINoyEQSox9pdRa66Uh3NDYgIyHE1lJbvzz89K5VxXTcNwJGiYBnD0d2KlvT4nooH7CyMHrB/Jm3mRs1kUATUrJEuq0ryZu68O2RzqQR0tJlxIRTesBlleRgBgjNyPpCPydgglD5uo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p/iRt5HO; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p/iRt5HO"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a16c399641so58730585e9.2
        for <oe-kbuild-all@lists.linux.dev>; Fri, 16 Oct 2026 00:58:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792137532; x=1792742332; darn=lists.linux.dev;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RdDTPL+e3DfNdEsfD+HIy5AjVm5FA/QQsbvM5foi09A=;
        b=p/iRt5HO0YQ4hn/455FfMlQh8eRROCwjn68C7iG6slUny+7CWmqSUG0qOGcPIGG4bC
         9eQ4eDlhxOT5yDEPABnTtT4ZN6ibhoKwlU03EbZdnREzG8rnm98HOMmL8uUbAoqXlFrQ
         aT16Pla6WbbbIdO9zwQtyY4IS0GfnUgbDUMk2tuQBZOCkkARG4Jdz5ZEBqG1BWbBC7D1
         VRvWtpCbYZ0JREL4QqWRIEyfU0oTSZBZ62gkNGmV3dyLfWUKBZJPgjGO5h5d0ZH0JvIf
         SFggkoZtmrVJC1FBmQKV5kkPK/Blk0rxy2R0AmujRPnlQvKXgN3xfnavQsxBfi2dGyOK
         q5dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792137532; x=1792742332;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RdDTPL+e3DfNdEsfD+HIy5AjVm5FA/QQsbvM5foi09A=;
        b=NB8IHuog636KKiq1m1VdC3ly05kOFo5pJ4z8HawTbFdRrcztQgo1w+B+w4Azlfb4Gu
         FcwRFIK+SDuxu6wNItNOpvZr59etvUePrvF0BRkv9NemZQ7AIogI7ANI5z4JqN+th2MP
         AV+ygw27ooVASbn8WDoxIi7MuMAdg/qWZQVJ6efUjKzav+X1R65CGLBlq6AVLwkzMUNN
         v/3Eii5kK4xo+zt1KmnEeA3JIIa0qTrFXgqHQbZrSEk6tixCbICBSpvs4KlXTqimLpGf
         pU/Ic39/H4YB1wQ3nsKH/tjM611b5/rzQOdmn+IJDFSuAp19o9JeVlhqtHsfENID5L0k
         h/wQ==
X-Forwarded-Encrypted: i=1; AKwUvBxGce6CiXDr15SsXmt50e31U3MD6a+ZjU+aquwZPrsOQLJJcr0n2MjQYN14W1nxOz3vAXhNNGLiFM6MHtet@lists.linux.dev
X-Gm-Message-State: AFq9FYKGsU+P5O6A9j0SiXekMFrN4xnno0gLaLIIiN9XdYcjMUeMwTWB
	i61h3xWIq1RIqZJS7eFGi5N8yzQrKMYmhdHx/js5sO/1U0N3jQhfkKNi
X-Gm-Gg: AYBFou29Iqdg1rGiEL/zEjyrT2MawavEqQiID99SIJr5hYQiJczLe7W9wJsfvVyX85u
	xnEIPzjVSXNj8iBk1EuaL6xdbezI1dVt+fzBgOiKCy7ON9ox7naJGneqFq+8rHBgcGu7ikeLzlb
	l099WirTUysASOCBgL6z2mpiWKv29M9b8SQfNGUsWeJJKRwFlDXj74s4ukBx64k55s/UsuYmT5a
	H7g/wXFc88m7v6lZ1a9TK8XY+zp2+azUqjHqJVoJt0VHxejfOzopWAK6WA59sPk2QG0cgIlogMw
	LbVeVHvGtGtSHykVqbVGV35KDjr0bbBclB1IgxLSmjYK02zT5rQNyA16BMiogu1nbEU9HWMOnte
	9IGj+g5ucOvVLtal2OzpjH+qwjpj4/HfBAqUgHBlUmGCi5mALPt51Luh4nHKynsiUKC3XusmgEI
	BI8k5bPMYhV/+QYT339fogzdpN89g/WncOny1932vjDakM18sZILuwFJtRUCi+r7YI7Gs=
X-Received: by 2002:a05:600c:698d:b0:4a1:97c6:d2b4 with SMTP id 5b1f17b1804b1-4a197c6d614mr360351215e9.15.1792137531460;
        Fri, 16 Oct 2026 00:58:51 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1c8a9ea3bsm30374275e9.0.2026.10.16.00.58.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 00:58:50 -0700 (PDT)
Date: Fri, 16 Oct 2026 10:58:47 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Zhang Yi <yi.zhang@huawei.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-ext4@vger.kernel.org, Theodore Ts'o <tytso@mit.edu>
Subject: [tytso-ext4:dev 40/41] fs/ext4/inode.c:4518 ext4_iomap_writepages()
 warn: missing error code? 'ret'
Message-ID: <atHZN9YIl8T2E0tK@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tytso/ext4.git dev
head:   8c4f6e3376348fc3162eed86a05b933921c8f9ed
commit: bdcbb0f19e921c7ea3241f55922032dff23d1d26 [40/41] ext4: partially enable iomap for the buffered I/O path of regular files
config: x86_64-randconfig-2200-20261016 (https://download.01.org/0day-ci/archive/20261016/202610160314.PLMEXaOJ-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202610160314.PLMEXaOJ-lkp@intel.com/

New smatch warnings:
fs/ext4/inode.c:4518 ext4_iomap_writepages() warn: missing error code? 'ret'

vim +/ret +4518 fs/ext4/inode.c

a304299a40d92c Zhang Yi 2026-10-09  4488  static int ext4_iomap_writepages(struct address_space *mapping,
a304299a40d92c Zhang Yi 2026-10-09  4489  				 struct writeback_control *wbc)
a304299a40d92c Zhang Yi 2026-10-09  4490  {
a2e096bf59634f Zhang Yi 2026-10-09  4491  	struct inode *inode = mapping->host;
a2e096bf59634f Zhang Yi 2026-10-09  4492  	struct super_block *sb = inode->i_sb;
a2e096bf59634f Zhang Yi 2026-10-09  4493  	long nr = wbc->nr_to_write;
a2e096bf59634f Zhang Yi 2026-10-09  4494  	int alloc_ctx, ret;
a2e096bf59634f Zhang Yi 2026-10-09  4495  	struct iomap_writepage_ctx wpc = {
a2e096bf59634f Zhang Yi 2026-10-09  4496  		.inode = inode,
a2e096bf59634f Zhang Yi 2026-10-09  4497  		.wbc = wbc,
a2e096bf59634f Zhang Yi 2026-10-09  4498  		.ops = &ext4_writeback_ops,
a2e096bf59634f Zhang Yi 2026-10-09  4499  	};
a2e096bf59634f Zhang Yi 2026-10-09  4500  
a2e096bf59634f Zhang Yi 2026-10-09  4501  	ret = ext4_emergency_state(sb);
a2e096bf59634f Zhang Yi 2026-10-09  4502  	if (unlikely(ret))
a2e096bf59634f Zhang Yi 2026-10-09  4503  		return ret;
a2e096bf59634f Zhang Yi 2026-10-09  4504  
53fe71a6bcad0f Zhang Yi 2026-10-09  4505  	/*
53fe71a6bcad0f Zhang Yi 2026-10-09  4506  	 * Submit the pending zeroed EOF block range if the entire
53fe71a6bcad0f Zhang Yi 2026-10-09  4507  	 * writeback range lies beyond it.
53fe71a6bcad0f Zhang Yi 2026-10-09  4508  	 */
53fe71a6bcad0f Zhang Yi 2026-10-09  4509  	ext4_iomap_wb_submit_zeroed_eof(inode, wbc);
53fe71a6bcad0f Zhang Yi 2026-10-09  4510  
a2e096bf59634f Zhang Yi 2026-10-09  4511  	alloc_ctx = ext4_writepages_down_read(sb);
bdcbb0f19e921c Zhang Yi 2026-10-09  4512  	/*
bdcbb0f19e921c Zhang Yi 2026-10-09  4513  	 * Does ext4_change_inode_journal_flag() change the inode's
bdcbb0f19e921c Zhang Yi 2026-10-09  4514  	 * buffered I/O path?
bdcbb0f19e921c Zhang Yi 2026-10-09  4515  	 */
bdcbb0f19e921c Zhang Yi 2026-10-09  4516  	if (!ext4_inode_buffered_iomap(inode)) {
bdcbb0f19e921c Zhang Yi 2026-10-09  4517  		ext4_writepages_up_read(sb, alloc_ctx);
bdcbb0f19e921c Zhang Yi 2026-10-09 @4518  		return ret;

Either return 0 or an error code here, but not ret.

bdcbb0f19e921c Zhang Yi 2026-10-09  4519  	}
bdcbb0f19e921c Zhang Yi 2026-10-09  4520  
a2e096bf59634f Zhang Yi 2026-10-09  4521  	trace_ext4_writepages(inode, wbc);
a2e096bf59634f Zhang Yi 2026-10-09  4522  	ret = iomap_writepages(&wpc);
a2e096bf59634f Zhang Yi 2026-10-09  4523  	trace_ext4_writepages_result(inode, wbc, ret, nr - wbc->nr_to_write);
a2e096bf59634f Zhang Yi 2026-10-09  4524  	ext4_writepages_up_read(sb, alloc_ctx);
a2e096bf59634f Zhang Yi 2026-10-09  4525  
a2e096bf59634f Zhang Yi 2026-10-09  4526  	return ret;
a304299a40d92c Zhang Yi 2026-10-09  4527  }

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

