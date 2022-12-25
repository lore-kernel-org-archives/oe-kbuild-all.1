Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8053836D
	for <oe-kbuild-all@lists.linux.dev>; Sun, 25 Dec 2022 04:44:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1671943498; x=1703479498;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4r6AcL1dZJTTb8DjM/AUlQcD1jLuJponDNvuwnr7mSw=;
  b=OwG3l0xd9YurLuqsAwG+rK3+ELefc5n4E9HKowPrBCIR4HSbBAPgewPh
   JPxny9uRhFJfB5mSaHHfXGfUSPQ5OwhsgA3g0IPGJIQ32vlTkJoXKE6tB
   WNr00rwU1S/ovIziM17p5o/+9XWLgX5oGEOl+hA9wxLI+aZwP46e1x6Bx
   0lk8sQxL/dqE/olASlP33TQ0Bg7/2lJqLCm+qXW4d4Q406rGST+Gtpvxu
   Km7tBNoHSCBuKB7e7ISPcpdHO/gQIV2GDZhl9LBprbJHoCsJZURrll9K9
   TfueNUQ4R1V8bSBt/IAUcKRQcN17SsAo0dvXL7P0AyFKapvuSUHxQ0lZt
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10571"; a="300146464"
X-IronPort-AV: E=Sophos;i="5.96,272,1665471600"; 
   d="scan'208";a="300146464"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2022 20:44:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10571"; a="897845889"
X-IronPort-AV: E=Sophos;i="5.96,272,1665471600"; 
   d="scan'208";a="897845889"
Received: from lkp-server01.sh.intel.com (HELO b5d47979f3ad) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 24 Dec 2022 20:44:55 -0800
Received: from kbuild by b5d47979f3ad with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1p9IsY-000DkD-2V;
	Sun, 25 Dec 2022 04:44:54 +0000
Date: Sun, 25 Dec 2022 12:44:21 +0800
From: kernel test robot <lkp@intel.com>
To: Ammar Faizi <ammarfaizi2@gnuweeb.org>,
	GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ammarfaizi2-block:google/android/kernel/common/android-4.19-stable
 277/9999] fs/f2fs/file.c:3434:16: sparse: sparse: incorrect type in
 initializer (different address spaces)
Message-ID: <202212251244.mGC4xeBn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="3okMbrqwq/wIWsrV"
Content-Disposition: inline


--3okMbrqwq/wIWsrV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/ammarfaizi2/linux-block google/android/kernel/common/android-4.19-stable
head:   22fdca5318397c60f564ba993e10e37af63a2c37
commit: 714629517bbdacc1d240de3dc70e7df9528f5ffa [277/9999] Merge remote-tracking branch 'aosp/upstream-f2fs-stable-linux-4.19.y' into android-4.19 (v5.7-rc1)
config: xtensa-randconfig-s043-20221225
compiler: xtensa-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/ammarfaizi2/linux-block/commit/714629517bbdacc1d240de3dc70e7df9528f5ffa
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
        git fetch --no-tags ammarfaizi2-block google/android/kernel/common/android-4.19-stable
        git checkout 714629517bbdacc1d240de3dc70e7df9528f5ffa
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=xtensa olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=xtensa SHELL=/bin/bash arch/xtensa/kernel/ fs/f2fs/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

sparse warnings: (new ones prefixed by >>)
   fs/f2fs/file.c:1964:16: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected int *__pu_addr @@     got int [noderef] <asn:1> * @@
   fs/f2fs/file.c:1964:16: sparse:     expected int *__pu_addr
   fs/f2fs/file.c:1964:16: sparse:     got int [noderef] <asn:1> *
   fs/f2fs/file.c:1964:16: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] <asn:1> *to @@     got int *__pu_addr @@
   fs/f2fs/file.c:1964:16: sparse:     expected void [noderef] <asn:1> *to
   fs/f2fs/file.c:1964:16: sparse:     got int *__pu_addr
   fs/f2fs/file.c:1978:13: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected int const *__gu_addr @@     got int [noderef] <asn:1> * @@
   fs/f2fs/file.c:1978:13: sparse:     expected int const *__gu_addr
   fs/f2fs/file.c:1978:13: sparse:     got int [noderef] <asn:1> *
   fs/f2fs/file.c:1978:13: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] <asn:1> *from @@     got int const *__gu_addr @@
   fs/f2fs/file.c:1978:13: sparse:     expected void const [noderef] <asn:1> *from
   fs/f2fs/file.c:1978:13: sparse:     got int const *__gu_addr
   fs/f2fs/file.c:2012:16: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected int *__pu_addr @@     got int [noderef] <asn:1> * @@
   fs/f2fs/file.c:2012:16: sparse:     expected int *__pu_addr
   fs/f2fs/file.c:2012:16: sparse:     got int [noderef] <asn:1> *
   fs/f2fs/file.c:2012:16: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] <asn:1> *to @@     got int *__pu_addr @@
   fs/f2fs/file.c:2012:16: sparse:     expected void [noderef] <asn:1> *to
   fs/f2fs/file.c:2012:16: sparse:     got int *__pu_addr
   fs/f2fs/file.c:2232:13: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned int const *__gu_addr @@     got unsigned int [noderef] [usertype] <asn:1> * @@
   fs/f2fs/file.c:2232:13: sparse:     expected unsigned int const *__gu_addr
   fs/f2fs/file.c:2232:13: sparse:     got unsigned int [noderef] [usertype] <asn:1> *
   fs/f2fs/file.c:2232:13: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] <asn:1> *from @@     got unsigned int const *__gu_addr @@
   fs/f2fs/file.c:2232:13: sparse:     expected void const [noderef] <asn:1> *from
   fs/f2fs/file.c:2232:13: sparse:     got unsigned int const *__gu_addr
   fs/f2fs/file.c:2462:13: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned int const *__gu_addr @@     got unsigned int [noderef] [usertype] <asn:1> * @@
   fs/f2fs/file.c:2462:13: sparse:     expected unsigned int const *__gu_addr
   fs/f2fs/file.c:2462:13: sparse:     got unsigned int [noderef] [usertype] <asn:1> *
   fs/f2fs/file.c:2462:13: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] <asn:1> *from @@     got unsigned int const *__gu_addr @@
   fs/f2fs/file.c:2462:13: sparse:     expected void const [noderef] <asn:1> *from
   fs/f2fs/file.c:2462:13: sparse:     got unsigned int const *__gu_addr
   fs/f2fs/file.c:2979:16: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned int *__pu_addr @@     got unsigned int [noderef] [usertype] <asn:1> * @@
   fs/f2fs/file.c:2979:16: sparse:     expected unsigned int *__pu_addr
   fs/f2fs/file.c:2979:16: sparse:     got unsigned int [noderef] [usertype] <asn:1> *
   fs/f2fs/file.c:2979:16: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] <asn:1> *to @@     got unsigned int *__pu_addr @@
   fs/f2fs/file.c:2979:16: sparse:     expected void [noderef] <asn:1> *to
   fs/f2fs/file.c:2979:16: sparse:     got unsigned int *__pu_addr
   fs/f2fs/file.c:3217:13: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned int const *__gu_addr @@     got unsigned int [noderef] [usertype] <asn:1> * @@
   fs/f2fs/file.c:3217:13: sparse:     expected unsigned int const *__gu_addr
   fs/f2fs/file.c:3217:13: sparse:     got unsigned int [noderef] [usertype] <asn:1> *
   fs/f2fs/file.c:3217:13: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] <asn:1> *from @@     got unsigned int const *__gu_addr @@
   fs/f2fs/file.c:3217:13: sparse:     expected void const [noderef] <asn:1> *from
   fs/f2fs/file.c:3217:13: sparse:     got unsigned int const *__gu_addr
   fs/f2fs/file.c:3274:16: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned int *__pu_addr @@     got unsigned int [noderef] [usertype] <asn:1> * @@
   fs/f2fs/file.c:3274:16: sparse:     expected unsigned int *__pu_addr
   fs/f2fs/file.c:3274:16: sparse:     got unsigned int [noderef] [usertype] <asn:1> *
   fs/f2fs/file.c:3274:16: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] <asn:1> *to @@     got unsigned int *__pu_addr @@
   fs/f2fs/file.c:3274:16: sparse:     expected void [noderef] <asn:1> *to
   fs/f2fs/file.c:3274:16: sparse:     got unsigned int *__pu_addr
   fs/f2fs/file.c:3373:36: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned short const [usertype] *pwcs @@     got restricted __le16 * @@
   fs/f2fs/file.c:3373:36: sparse:     expected unsigned short const [usertype] *pwcs
   fs/f2fs/file.c:3373:36: sparse:     got restricted __le16 *
   fs/f2fs/file.c:3409:28: sparse: sparse: incorrect type in argument 4 (different base types) @@     expected unsigned short [usertype] *pwcs @@     got restricted __le16 * @@
   fs/f2fs/file.c:3409:28: sparse:     expected unsigned short [usertype] *pwcs
   fs/f2fs/file.c:3409:28: sparse:     got restricted __le16 *
>> fs/f2fs/file.c:3434:16: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned long long *__pu_addr @@     got unsigned long long [noderef] [usertype] <asn:1> * @@
   fs/f2fs/file.c:3434:16: sparse:     expected unsigned long long *__pu_addr
   fs/f2fs/file.c:3434:16: sparse:     got unsigned long long [noderef] [usertype] <asn:1> *
>> fs/f2fs/file.c:3434:16: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] <asn:1> *to @@     got unsigned long long *__pu_addr @@
   fs/f2fs/file.c:3434:16: sparse:     expected void [noderef] <asn:1> *to
   fs/f2fs/file.c:3434:16: sparse:     got unsigned long long *__pu_addr

vim +3434 fs/f2fs/file.c

1ad71a27124caf Jaegeuk Kim  2017-12-07  3266  
1ad71a27124caf Jaegeuk Kim  2017-12-07  3267  static int f2fs_ioc_get_pin_file(struct file *filp, unsigned long arg)
1ad71a27124caf Jaegeuk Kim  2017-12-07  3268  {
1ad71a27124caf Jaegeuk Kim  2017-12-07  3269  	struct inode *inode = file_inode(filp);
1ad71a27124caf Jaegeuk Kim  2017-12-07  3270  	__u32 pin = 0;
1ad71a27124caf Jaegeuk Kim  2017-12-07  3271  
1ad71a27124caf Jaegeuk Kim  2017-12-07  3272  	if (is_inode_flag_set(inode, FI_PIN_FILE))
2ef79ecb5e906d Chao Yu      2018-05-07  3273  		pin = F2FS_I(inode)->i_gc_failures[GC_FAILURE_PIN];
1ad71a27124caf Jaegeuk Kim  2017-12-07 @3274  	return put_user(pin, (u32 __user *)arg);
1ad71a27124caf Jaegeuk Kim  2017-12-07  3275  }
1ad71a27124caf Jaegeuk Kim  2017-12-07  3276  
c4020b2da4c9e8 Chao Yu      2018-01-11  3277  int f2fs_precache_extents(struct inode *inode)
c4020b2da4c9e8 Chao Yu      2018-01-11  3278  {
c4020b2da4c9e8 Chao Yu      2018-01-11  3279  	struct f2fs_inode_info *fi = F2FS_I(inode);
c4020b2da4c9e8 Chao Yu      2018-01-11  3280  	struct f2fs_map_blocks map;
c4020b2da4c9e8 Chao Yu      2018-01-11  3281  	pgoff_t m_next_extent;
c4020b2da4c9e8 Chao Yu      2018-01-11  3282  	loff_t end;
c4020b2da4c9e8 Chao Yu      2018-01-11  3283  	int err;
c4020b2da4c9e8 Chao Yu      2018-01-11  3284  
c4020b2da4c9e8 Chao Yu      2018-01-11  3285  	if (is_inode_flag_set(inode, FI_NO_EXTENT))
c4020b2da4c9e8 Chao Yu      2018-01-11  3286  		return -EOPNOTSUPP;
c4020b2da4c9e8 Chao Yu      2018-01-11  3287  
c4020b2da4c9e8 Chao Yu      2018-01-11  3288  	map.m_lblk = 0;
c4020b2da4c9e8 Chao Yu      2018-01-11  3289  	map.m_next_pgofs = NULL;
c4020b2da4c9e8 Chao Yu      2018-01-11  3290  	map.m_next_extent = &m_next_extent;
c4020b2da4c9e8 Chao Yu      2018-01-11  3291  	map.m_seg_type = NO_CHECK_TYPE;
2f3fdac27c1af3 Jia Zhu      2018-11-20  3292  	map.m_may_create = false;
c4020b2da4c9e8 Chao Yu      2018-01-11  3293  	end = F2FS_I_SB(inode)->max_file_blocks;
c4020b2da4c9e8 Chao Yu      2018-01-11  3294  
c4020b2da4c9e8 Chao Yu      2018-01-11  3295  	while (map.m_lblk < end) {
c4020b2da4c9e8 Chao Yu      2018-01-11  3296  		map.m_len = end - map.m_lblk;
c4020b2da4c9e8 Chao Yu      2018-01-11  3297  
b2532c694033fb Chao Yu      2018-04-24  3298  		down_write(&fi->i_gc_rwsem[WRITE]);
c4020b2da4c9e8 Chao Yu      2018-01-11  3299  		err = f2fs_map_blocks(inode, &map, 0, F2FS_GET_BLOCK_PRECACHE);
b2532c694033fb Chao Yu      2018-04-24  3300  		up_write(&fi->i_gc_rwsem[WRITE]);
c4020b2da4c9e8 Chao Yu      2018-01-11  3301  		if (err)
c4020b2da4c9e8 Chao Yu      2018-01-11  3302  			return err;
c4020b2da4c9e8 Chao Yu      2018-01-11  3303  
c4020b2da4c9e8 Chao Yu      2018-01-11  3304  		map.m_lblk = m_next_extent;
c4020b2da4c9e8 Chao Yu      2018-01-11  3305  	}
c4020b2da4c9e8 Chao Yu      2018-01-11  3306  
c4020b2da4c9e8 Chao Yu      2018-01-11  3307  	return err;
c4020b2da4c9e8 Chao Yu      2018-01-11  3308  }
c4020b2da4c9e8 Chao Yu      2018-01-11  3309  
c4020b2da4c9e8 Chao Yu      2018-01-11  3310  static int f2fs_ioc_precache_extents(struct file *filp, unsigned long arg)
c4020b2da4c9e8 Chao Yu      2018-01-11  3311  {
c4020b2da4c9e8 Chao Yu      2018-01-11  3312  	return f2fs_precache_extents(file_inode(filp));
c4020b2da4c9e8 Chao Yu      2018-01-11  3313  }
c4020b2da4c9e8 Chao Yu      2018-01-11  3314  
0177d8f11604b8 Qiuyang Sun  2019-06-05  3315  static int f2fs_ioc_resize_fs(struct file *filp, unsigned long arg)
0177d8f11604b8 Qiuyang Sun  2019-06-05  3316  {
0177d8f11604b8 Qiuyang Sun  2019-06-05  3317  	struct f2fs_sb_info *sbi = F2FS_I_SB(file_inode(filp));
0177d8f11604b8 Qiuyang Sun  2019-06-05  3318  	__u64 block_count;
0177d8f11604b8 Qiuyang Sun  2019-06-05  3319  	int ret;
0177d8f11604b8 Qiuyang Sun  2019-06-05  3320  
0177d8f11604b8 Qiuyang Sun  2019-06-05  3321  	if (!capable(CAP_SYS_ADMIN))
0177d8f11604b8 Qiuyang Sun  2019-06-05  3322  		return -EPERM;
0177d8f11604b8 Qiuyang Sun  2019-06-05  3323  
0177d8f11604b8 Qiuyang Sun  2019-06-05  3324  	if (f2fs_readonly(sbi->sb))
0177d8f11604b8 Qiuyang Sun  2019-06-05  3325  		return -EROFS;
0177d8f11604b8 Qiuyang Sun  2019-06-05  3326  
0177d8f11604b8 Qiuyang Sun  2019-06-05  3327  	if (copy_from_user(&block_count, (void __user *)arg,
0177d8f11604b8 Qiuyang Sun  2019-06-05  3328  			   sizeof(block_count)))
0177d8f11604b8 Qiuyang Sun  2019-06-05  3329  		return -EFAULT;
0177d8f11604b8 Qiuyang Sun  2019-06-05  3330  
0177d8f11604b8 Qiuyang Sun  2019-06-05  3331  	ret = f2fs_resize_fs(sbi, block_count);
0177d8f11604b8 Qiuyang Sun  2019-06-05  3332  
0177d8f11604b8 Qiuyang Sun  2019-06-05  3333  	return ret;
0177d8f11604b8 Qiuyang Sun  2019-06-05  3334  }
0177d8f11604b8 Qiuyang Sun  2019-06-05  3335  
b27113a45cb688 Eric Biggers 2019-07-22  3336  static int f2fs_ioc_enable_verity(struct file *filp, unsigned long arg)
b27113a45cb688 Eric Biggers 2019-07-22  3337  {
b27113a45cb688 Eric Biggers 2019-07-22  3338  	struct inode *inode = file_inode(filp);
b27113a45cb688 Eric Biggers 2019-07-22  3339  
b27113a45cb688 Eric Biggers 2019-07-22  3340  	f2fs_update_time(F2FS_I_SB(inode), REQ_TIME);
b27113a45cb688 Eric Biggers 2019-07-22  3341  
b27113a45cb688 Eric Biggers 2019-07-22  3342  	if (!f2fs_sb_has_verity(F2FS_I_SB(inode))) {
b27113a45cb688 Eric Biggers 2019-07-22  3343  		f2fs_warn(F2FS_I_SB(inode),
b27113a45cb688 Eric Biggers 2019-07-22  3344  			  "Can't enable fs-verity on inode %lu: the verity feature is not enabled on this filesystem.\n",
b27113a45cb688 Eric Biggers 2019-07-22  3345  			  inode->i_ino);
b27113a45cb688 Eric Biggers 2019-07-22  3346  		return -EOPNOTSUPP;
b27113a45cb688 Eric Biggers 2019-07-22  3347  	}
b27113a45cb688 Eric Biggers 2019-07-22  3348  
b27113a45cb688 Eric Biggers 2019-07-22  3349  	return fsverity_ioctl_enable(filp, (const void __user *)arg);
b27113a45cb688 Eric Biggers 2019-07-22  3350  }
b27113a45cb688 Eric Biggers 2019-07-22  3351  
b27113a45cb688 Eric Biggers 2019-07-22  3352  static int f2fs_ioc_measure_verity(struct file *filp, unsigned long arg)
b27113a45cb688 Eric Biggers 2019-07-22  3353  {
b27113a45cb688 Eric Biggers 2019-07-22  3354  	if (!f2fs_sb_has_verity(F2FS_I_SB(file_inode(filp))))
b27113a45cb688 Eric Biggers 2019-07-22  3355  		return -EOPNOTSUPP;
b27113a45cb688 Eric Biggers 2019-07-22  3356  
b27113a45cb688 Eric Biggers 2019-07-22  3357  	return fsverity_ioctl_measure(filp, (void __user *)arg);
b27113a45cb688 Eric Biggers 2019-07-22  3358  }
b27113a45cb688 Eric Biggers 2019-07-22  3359  
2f7cc89b033f4d Chao Yu      2019-07-17  3360  static int f2fs_get_volume_name(struct file *filp, unsigned long arg)
2f7cc89b033f4d Chao Yu      2019-07-17  3361  {
2f7cc89b033f4d Chao Yu      2019-07-17  3362  	struct inode *inode = file_inode(filp);
2f7cc89b033f4d Chao Yu      2019-07-17  3363  	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
2f7cc89b033f4d Chao Yu      2019-07-17  3364  	char *vbuf;
2f7cc89b033f4d Chao Yu      2019-07-17  3365  	int count;
2f7cc89b033f4d Chao Yu      2019-07-17  3366  	int err = 0;
2f7cc89b033f4d Chao Yu      2019-07-17  3367  
2f7cc89b033f4d Chao Yu      2019-07-17  3368  	vbuf = f2fs_kzalloc(sbi, MAX_VOLUME_NAME, GFP_KERNEL);
2f7cc89b033f4d Chao Yu      2019-07-17  3369  	if (!vbuf)
2f7cc89b033f4d Chao Yu      2019-07-17  3370  		return -ENOMEM;
2f7cc89b033f4d Chao Yu      2019-07-17  3371  
2f7cc89b033f4d Chao Yu      2019-07-17  3372  	down_read(&sbi->sb_lock);
2f7cc89b033f4d Chao Yu      2019-07-17 @3373  	count = utf16s_to_utf8s(sbi->raw_super->volume_name,
2f7cc89b033f4d Chao Yu      2019-07-17  3374  			ARRAY_SIZE(sbi->raw_super->volume_name),
2f7cc89b033f4d Chao Yu      2019-07-17  3375  			UTF16_LITTLE_ENDIAN, vbuf, MAX_VOLUME_NAME);
2f7cc89b033f4d Chao Yu      2019-07-17  3376  	up_read(&sbi->sb_lock);
2f7cc89b033f4d Chao Yu      2019-07-17  3377  
2f7cc89b033f4d Chao Yu      2019-07-17  3378  	if (copy_to_user((char __user *)arg, vbuf,
2f7cc89b033f4d Chao Yu      2019-07-17  3379  				min(FSLABEL_MAX, count)))
2f7cc89b033f4d Chao Yu      2019-07-17  3380  		err = -EFAULT;
2f7cc89b033f4d Chao Yu      2019-07-17  3381  
2f7cc89b033f4d Chao Yu      2019-07-17  3382  	kvfree(vbuf);
2f7cc89b033f4d Chao Yu      2019-07-17  3383  	return err;
2f7cc89b033f4d Chao Yu      2019-07-17  3384  }
2f7cc89b033f4d Chao Yu      2019-07-17  3385  
2f7cc89b033f4d Chao Yu      2019-07-17  3386  static int f2fs_set_volume_name(struct file *filp, unsigned long arg)
2f7cc89b033f4d Chao Yu      2019-07-17  3387  {
2f7cc89b033f4d Chao Yu      2019-07-17  3388  	struct inode *inode = file_inode(filp);
2f7cc89b033f4d Chao Yu      2019-07-17  3389  	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
2f7cc89b033f4d Chao Yu      2019-07-17  3390  	char *vbuf;
2f7cc89b033f4d Chao Yu      2019-07-17  3391  	int err = 0;
2f7cc89b033f4d Chao Yu      2019-07-17  3392  
2f7cc89b033f4d Chao Yu      2019-07-17  3393  	if (!capable(CAP_SYS_ADMIN))
2f7cc89b033f4d Chao Yu      2019-07-17  3394  		return -EPERM;
2f7cc89b033f4d Chao Yu      2019-07-17  3395  
2f7cc89b033f4d Chao Yu      2019-07-17  3396  	vbuf = strndup_user((const char __user *)arg, FSLABEL_MAX);
2f7cc89b033f4d Chao Yu      2019-07-17  3397  	if (IS_ERR(vbuf))
2f7cc89b033f4d Chao Yu      2019-07-17  3398  		return PTR_ERR(vbuf);
2f7cc89b033f4d Chao Yu      2019-07-17  3399  
2f7cc89b033f4d Chao Yu      2019-07-17  3400  	err = mnt_want_write_file(filp);
2f7cc89b033f4d Chao Yu      2019-07-17  3401  	if (err)
2f7cc89b033f4d Chao Yu      2019-07-17  3402  		goto out;
2f7cc89b033f4d Chao Yu      2019-07-17  3403  
2f7cc89b033f4d Chao Yu      2019-07-17  3404  	down_write(&sbi->sb_lock);
2f7cc89b033f4d Chao Yu      2019-07-17  3405  
2f7cc89b033f4d Chao Yu      2019-07-17  3406  	memset(sbi->raw_super->volume_name, 0,
2f7cc89b033f4d Chao Yu      2019-07-17  3407  			sizeof(sbi->raw_super->volume_name));
2f7cc89b033f4d Chao Yu      2019-07-17  3408  	utf8s_to_utf16s(vbuf, strlen(vbuf), UTF16_LITTLE_ENDIAN,
2f7cc89b033f4d Chao Yu      2019-07-17  3409  			sbi->raw_super->volume_name,
2f7cc89b033f4d Chao Yu      2019-07-17  3410  			ARRAY_SIZE(sbi->raw_super->volume_name));
2f7cc89b033f4d Chao Yu      2019-07-17  3411  
2f7cc89b033f4d Chao Yu      2019-07-17  3412  	err = f2fs_commit_super(sbi, false);
2f7cc89b033f4d Chao Yu      2019-07-17  3413  
2f7cc89b033f4d Chao Yu      2019-07-17  3414  	up_write(&sbi->sb_lock);
2f7cc89b033f4d Chao Yu      2019-07-17  3415  
2f7cc89b033f4d Chao Yu      2019-07-17  3416  	mnt_drop_write_file(filp);
2f7cc89b033f4d Chao Yu      2019-07-17  3417  out:
2f7cc89b033f4d Chao Yu      2019-07-17  3418  	kfree(vbuf);
2f7cc89b033f4d Chao Yu      2019-07-17  3419  	return err;
2f7cc89b033f4d Chao Yu      2019-07-17  3420  }
2f7cc89b033f4d Chao Yu      2019-07-17  3421  
3b4f64cba2d320 Chao Yu      2020-02-21  3422  static int f2fs_get_compress_blocks(struct file *filp, unsigned long arg)
3b4f64cba2d320 Chao Yu      2020-02-21  3423  {
3b4f64cba2d320 Chao Yu      2020-02-21  3424  	struct inode *inode = file_inode(filp);
3b4f64cba2d320 Chao Yu      2020-02-21  3425  	__u64 blocks;
3b4f64cba2d320 Chao Yu      2020-02-21  3426  
3b4f64cba2d320 Chao Yu      2020-02-21  3427  	if (!f2fs_sb_has_compression(F2FS_I_SB(inode)))
3b4f64cba2d320 Chao Yu      2020-02-21  3428  		return -EOPNOTSUPP;
3b4f64cba2d320 Chao Yu      2020-02-21  3429  
3b4f64cba2d320 Chao Yu      2020-02-21  3430  	if (!f2fs_compressed_file(inode))
3b4f64cba2d320 Chao Yu      2020-02-21  3431  		return -EINVAL;
3b4f64cba2d320 Chao Yu      2020-02-21  3432  
3b4f64cba2d320 Chao Yu      2020-02-21  3433  	blocks = F2FS_I(inode)->i_compr_blocks;
3b4f64cba2d320 Chao Yu      2020-02-21 @3434  	return put_user(blocks, (u64 __user *)arg);
3b4f64cba2d320 Chao Yu      2020-02-21  3435  }
3b4f64cba2d320 Chao Yu      2020-02-21  3436  

:::::: The code at line 3434 was first introduced by commit
:::::: 3b4f64cba2d320ca09cbab4d33cd1ec4a0597f2d f2fs: introduce F2FS_IOC_GET_COMPRESS_BLOCKS

:::::: TO: Chao Yu <yuchao0@huawei.com>
:::::: CC: Jaegeuk Kim <jaegeuk@google.com>

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

--3okMbrqwq/wIWsrV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=config

#
# Automatically generated file; DO NOT EDIT.
# Linux/xtensa 4.19.115 Kernel Configuration
#

#
# Compiler: xtensa-linux-gcc (GCC) 12.1.0
#
CONFIG_CC_IS_GCC=y
CONFIG_GCC_VERSION=120100
CONFIG_CLANG_VERSION=0
CONFIG_CC_HAS_ASM_GOTO=y
CONFIG_IRQ_WORK=y
CONFIG_BUILDTIME_EXTABLE_SORT=y

#
# General setup
#
CONFIG_BROKEN_ON_SMP=y
CONFIG_INIT_ENV_ARG_LIMIT=32
CONFIG_COMPILE_TEST=y
CONFIG_LOCALVERSION=""
CONFIG_BUILD_SALT=""
CONFIG_DEFAULT_HOSTNAME="(none)"
# CONFIG_SWAP is not set
# CONFIG_SYSVIPC is not set
# CONFIG_POSIX_MQUEUE is not set
CONFIG_CROSS_MEMORY_ATTACH=y
CONFIG_USELIB=y
CONFIG_AUDIT=y

#
# IRQ subsystem
#
CONFIG_GENERIC_IRQ_SHOW=y
CONFIG_GENERIC_IRQ_CHIP=y
CONFIG_IRQ_DOMAIN=y
CONFIG_IRQ_SIM=y
# CONFIG_GENERIC_IRQ_DEBUGFS is not set
CONFIG_GENERIC_CLOCKEVENTS=y

#
# Timers subsystem
#
CONFIG_TICK_ONESHOT=y
CONFIG_NO_HZ_COMMON=y
# CONFIG_HZ_PERIODIC is not set
CONFIG_NO_HZ_IDLE=y
# CONFIG_NO_HZ is not set
CONFIG_HIGH_RES_TIMERS=y
# CONFIG_PREEMPT_NONE is not set
# CONFIG_PREEMPT_VOLUNTARY is not set
CONFIG_PREEMPT=y
CONFIG_PREEMPT_COUNT=y

#
# CPU/Task time and stats accounting
#
CONFIG_TICK_CPU_ACCOUNTING=y
CONFIG_IRQ_TIME_ACCOUNTING=y
CONFIG_PSI=y
CONFIG_PSI_DEFAULT_DISABLED=y
CONFIG_CPU_ISOLATION=y

#
# RCU Subsystem
#
CONFIG_PREEMPT_RCU=y
# CONFIG_RCU_EXPERT is not set
CONFIG_SRCU=y
CONFIG_TREE_SRCU=y
CONFIG_TASKS_RCU=y
CONFIG_RCU_STALL_COMMON=y
CONFIG_RCU_NEED_SEGCBLIST=y
CONFIG_BUILD_BIN2C=y
CONFIG_IKCONFIG=y
# CONFIG_IKHEADERS is not set
CONFIG_GENERIC_SCHED_CLOCK=y

#
# Scheduler features
#
# CONFIG_CGROUPS is not set
# CONFIG_CHECKPOINT_RESTORE is not set
# CONFIG_SCHED_AUTOGROUP is not set
# CONFIG_SYSFS_DEPRECATED is not set
# CONFIG_RELAY is not set
CONFIG_BLK_DEV_INITRD=y
CONFIG_INITRAMFS_SOURCE=""
# CONFIG_RD_GZIP is not set
# CONFIG_RD_BZIP2 is not set
CONFIG_RD_LZMA=y
# CONFIG_RD_XZ is not set
# CONFIG_RD_LZO is not set
# CONFIG_RD_LZ4 is not set
CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE=y
# CONFIG_CC_OPTIMIZE_FOR_SIZE is not set
CONFIG_BPF=y
CONFIG_EXPERT=y
# CONFIG_MULTIUSER is not set
# CONFIG_SGETMASK_SYSCALL is not set
# CONFIG_SYSFS_SYSCALL is not set
# CONFIG_FHANDLE is not set
CONFIG_POSIX_TIMERS=y
# CONFIG_PRINTK is not set
# CONFIG_BUG is not set
# CONFIG_ELF_CORE is not set
# CONFIG_BASE_FULL is not set
# CONFIG_FUTEX is not set
# CONFIG_EPOLL is not set
# CONFIG_SIGNALFD is not set
CONFIG_TIMERFD=y
CONFIG_EVENTFD=y
CONFIG_SHMEM=y
CONFIG_AIO=y
CONFIG_ADVISE_SYSCALLS=y
CONFIG_MEMBARRIER=y
CONFIG_KALLSYMS=y
CONFIG_KALLSYMS_ALL=y
CONFIG_KALLSYMS_BASE_RELATIVE=y
CONFIG_BPF_SYSCALL=y
CONFIG_USERFAULTFD=y
CONFIG_EMBEDDED=y
CONFIG_HAVE_PERF_EVENTS=y
CONFIG_PERF_USE_VMALLOC=y
CONFIG_PC104=y

#
# Kernel Performance Events And Counters
#
CONFIG_PERF_EVENTS=y
# CONFIG_DEBUG_PERF_USE_VMALLOC is not set
CONFIG_VM_EVENT_COUNTERS=y
CONFIG_SLUB_DEBUG=y
# CONFIG_COMPAT_BRK is not set
# CONFIG_SLAB is not set
CONFIG_SLUB=y
# CONFIG_SLOB is not set
CONFIG_SLAB_MERGE_DEFAULT=y
# CONFIG_SLAB_FREELIST_RANDOM is not set
CONFIG_SLAB_FREELIST_HARDENED=y
CONFIG_SYSTEM_DATA_VERIFICATION=y
CONFIG_PROFILING=y
CONFIG_TRACEPOINTS=y
CONFIG_ZONE_DMA=y
CONFIG_XTENSA=y
CONFIG_RWSEM_XCHGADD_ALGORITHM=y
CONFIG_GENERIC_HWEIGHT=y
CONFIG_HZ=100
CONFIG_LOCKDEP_SUPPORT=y
CONFIG_STACKTRACE_SUPPORT=y
CONFIG_TRACE_IRQFLAGS_SUPPORT=y
CONFIG_MMU=y
CONFIG_KASAN_SHADOW_OFFSET=0x6e400000

#
# Processor type and features
#
CONFIG_XTENSA_VARIANT_FSF=y
# CONFIG_XTENSA_VARIANT_DC232B is not set
# CONFIG_XTENSA_VARIANT_DC233C is not set
# CONFIG_XTENSA_VARIANT_CUSTOM is not set
CONFIG_XTENSA_VARIANT_NAME="fsf"
# CONFIG_XTENSA_UNALIGNED_USER is not set
CONFIG_KERNEL_LOAD_ADDRESS=0xd0003000
CONFIG_VECTORS_OFFSET=0x00003000
CONFIG_XTENSA_KSEG_MMU_V2=y
CONFIG_HIGHMEM=y
CONFIG_FAST_SYSCALL_XTENSA=y
CONFIG_FAST_SYSCALL_SPILL_REGISTERS=y
CONFIG_XTENSA_CALIBRATE_CCOUNT=y
CONFIG_SERIAL_CONSOLE=y

#
# Bus options
#
# CONFIG_PCI is not set

#
# PCI Endpoint
#
# CONFIG_PCI_ENDPOINT is not set

#
# Platform options
#
# CONFIG_XTENSA_PLATFORM_ISS is not set
# CONFIG_XTENSA_PLATFORM_XT2000 is not set
CONFIG_XTENSA_PLATFORM_XTFPGA=y
CONFIG_PLATFORM_NR_IRQS=0
# CONFIG_GENERIC_CALIBRATE_DELAY is not set
CONFIG_CMDLINE_BOOL=y
CONFIG_CMDLINE="console=ttyS0,38400 root=/dev/ram"
CONFIG_USE_OF=y
CONFIG_BUILTIN_DTB=""
# CONFIG_PARSE_BOOTPARAM is not set
CONFIG_FORCE_MAX_ZONEORDER=11
CONFIG_PCCARD=y
CONFIG_PCMCIA=y
# CONFIG_PCMCIA_LOAD_CIS is not set

#
# PC-card bridges
#
CONFIG_DEFAULT_MEM_START=0x00000000
CONFIG_XTFPGA_LCD=y
CONFIG_XTFPGA_LCD_BASE_ADDR=0x0d0c0000
# CONFIG_XTFPGA_LCD_8BIT_ACCESS is not set

#
# Power management options
#
# CONFIG_PM is not set

#
# General architecture-dependent options
#
# CONFIG_OPROFILE is not set
CONFIG_HAVE_OPROFILE=y
CONFIG_HAVE_DMA_CONTIGUOUS=y
CONFIG_HAVE_CLK=y
CONFIG_HAVE_HW_BREAKPOINT=y
CONFIG_ARCH_WANT_IPC_PARSE_VERSION=y
CONFIG_HAVE_STACKPROTECTOR=y
CONFIG_CC_HAS_STACKPROTECTOR_NONE=y
CONFIG_STACKPROTECTOR=y
# CONFIG_STACKPROTECTOR_STRONG is not set
CONFIG_LTO_NONE=y
CONFIG_HAVE_IRQ_TIME_ACCOUNTING=y
CONFIG_MODULES_USE_ELF_RELA=y
CONFIG_PGTABLE_LEVELS=2
CONFIG_HAVE_EXIT_THREAD=y
CONFIG_CLONE_BACKWARDS=y
# CONFIG_REFCOUNT_FULL is not set

#
# GCOV-based kernel profiling
#
# CONFIG_GCOV_KERNEL is not set
CONFIG_PLUGIN_HOSTCC=""
CONFIG_RT_MUTEXES=y
CONFIG_BASE_SMALL=1
# CONFIG_MODULES is not set
CONFIG_MODULES_TREE_LOOKUP=y
CONFIG_BLOCK=y
CONFIG_LBDAF=y
CONFIG_BLK_SCSI_REQUEST=y
CONFIG_BLK_DEV_BSG=y
CONFIG_BLK_DEV_BSGLIB=y
# CONFIG_BLK_DEV_INTEGRITY is not set
# CONFIG_BLK_DEV_ZONED is not set
# CONFIG_BLK_CMDLINE_PARSER is not set
# CONFIG_BLK_WBT is not set
CONFIG_BLK_DEBUG_FS=y
CONFIG_BLK_SED_OPAL=y
CONFIG_BLK_INLINE_ENCRYPTION=y
# CONFIG_BLK_INLINE_ENCRYPTION_FALLBACK is not set

#
# Partition Types
#
# CONFIG_PARTITION_ADVANCED is not set
CONFIG_AMIGA_PARTITION=y
CONFIG_MSDOS_PARTITION=y
CONFIG_EFI_PARTITION=y
CONFIG_BLK_MQ_VIRTIO=y

#
# IO Schedulers
#
CONFIG_IOSCHED_NOOP=y
CONFIG_IOSCHED_DEADLINE=y
CONFIG_IOSCHED_CFQ=y
# CONFIG_DEFAULT_DEADLINE is not set
CONFIG_DEFAULT_CFQ=y
# CONFIG_DEFAULT_NOOP is not set
CONFIG_DEFAULT_IOSCHED="cfq"
CONFIG_MQ_IOSCHED_DEADLINE=y
CONFIG_MQ_IOSCHED_KYBER=y
CONFIG_IOSCHED_BFQ=y
CONFIG_ASN1=y
CONFIG_UNINLINE_SPIN_UNLOCK=y
# CONFIG_GKI_HIDDEN_DRM_CONFIGS is not set
# CONFIG_GKI_HIDDEN_REGMAP_CONFIGS is not set
# CONFIG_GKI_HIDDEN_CRYPTO_CONFIGS is not set
# CONFIG_GKI_HIDDEN_SND_CONFIGS is not set
# CONFIG_GKI_HIDDEN_SND_SOC_CONFIGS is not set
# CONFIG_GKI_HIDDEN_GPIO_CONFIGS is not set
# CONFIG_GKI_HIDDEN_VIRTUAL_CONFIGS is not set
# CONFIG_GKI_LEGACY_WEXT_ALLCONFIG is not set
# CONFIG_GKI_HIDDEN_SOC_PM_CONFIGS is not set
# CONFIG_GKI_HIDDEN_VIDEOBUF2_CONFIGS is not set
# CONFIG_GKI_HIDDEN_USB_CONFIGS is not set
# CONFIG_GKI_HIDDEN_SOC_BUS_CONFIGS is not set
# CONFIG_GKI_HACKS_TO_FIX is not set

#
# Executable file formats
#
# CONFIG_BINFMT_ELF is not set
# CONFIG_BINFMT_SCRIPT is not set
CONFIG_BINFMT_MISC=y
CONFIG_COREDUMP=y

#
# Memory Management options
#
CONFIG_FLATMEM=y
CONFIG_FLAT_NODE_MEM_MAP=y
CONFIG_HAVE_MEMBLOCK=y
CONFIG_NO_BOOTMEM=y
CONFIG_MEMORY_ISOLATION=y
CONFIG_SPLIT_PTLOCK_CPUS=4
CONFIG_MEMORY_BALLOON=y
# CONFIG_COMPACTION is not set
CONFIG_MIGRATION=y
CONFIG_BOUNCE=y
CONFIG_VIRT_TO_BUS=y
CONFIG_KSM=y
CONFIG_DEFAULT_MMAP_MIN_ADDR=4096
CONFIG_NEED_PER_CPU_KM=y
# CONFIG_CLEANCACHE is not set
CONFIG_CMA=y
# CONFIG_CMA_DEBUG is not set
CONFIG_CMA_DEBUGFS=y
CONFIG_CMA_AREAS=7
# CONFIG_ZPOOL is not set
# CONFIG_ZBUD is not set
# CONFIG_ZSMALLOC is not set
# CONFIG_IDLE_PAGE_TRACKING is not set
CONFIG_FRAME_VECTOR=y
CONFIG_PERCPU_STATS=y
# CONFIG_GUP_BENCHMARK is not set
CONFIG_NET=y

#
# Networking options
#
CONFIG_PACKET=y
# CONFIG_PACKET_DIAG is not set
CONFIG_UNIX=y
CONFIG_UNIX_DIAG=y
CONFIG_TLS=y
CONFIG_TLS_DEVICE=y
CONFIG_XFRM=y
CONFIG_XFRM_OFFLOAD=y
CONFIG_XFRM_ALGO=y
CONFIG_XFRM_USER=y
CONFIG_XFRM_INTERFACE=y
CONFIG_XFRM_SUB_POLICY=y
CONFIG_XFRM_MIGRATE=y
CONFIG_XFRM_IPCOMP=y
# CONFIG_NET_KEY is not set
CONFIG_XDP_SOCKETS=y
CONFIG_INET=y
CONFIG_IP_MULTICAST=y
# CONFIG_IP_ADVANCED_ROUTER is not set
CONFIG_IP_PNP=y
CONFIG_IP_PNP_DHCP=y
# CONFIG_IP_PNP_BOOTP is not set
# CONFIG_IP_PNP_RARP is not set
CONFIG_NET_IPIP=y
CONFIG_NET_IPGRE_DEMUX=y
CONFIG_NET_IP_TUNNEL=y
# CONFIG_NET_IPGRE is not set
# CONFIG_IP_MROUTE is not set
# CONFIG_SYN_COOKIES is not set
CONFIG_NET_IPVTI=y
# CONFIG_NET_FOU is not set
# CONFIG_NET_FOU_IP_TUNNELS is not set
CONFIG_INET_AH=y
CONFIG_INET_ESP=y
CONFIG_INET_ESP_OFFLOAD=y
CONFIG_INET_IPCOMP=y
CONFIG_INET_XFRM_TUNNEL=y
CONFIG_INET_TUNNEL=y
CONFIG_INET_XFRM_MODE_TRANSPORT=y
CONFIG_INET_XFRM_MODE_TUNNEL=y
CONFIG_INET_XFRM_MODE_BEET=y
# CONFIG_INET_DIAG is not set
CONFIG_TCP_CONG_ADVANCED=y
CONFIG_TCP_CONG_BIC=y
CONFIG_TCP_CONG_CUBIC=y
# CONFIG_TCP_CONG_WESTWOOD is not set
CONFIG_TCP_CONG_HTCP=y
CONFIG_TCP_CONG_HSTCP=y
CONFIG_TCP_CONG_HYBLA=y
CONFIG_TCP_CONG_VEGAS=y
# CONFIG_TCP_CONG_NV is not set
# CONFIG_TCP_CONG_SCALABLE is not set
CONFIG_TCP_CONG_LP=y
# CONFIG_TCP_CONG_VENO is not set
CONFIG_TCP_CONG_YEAH=y
# CONFIG_TCP_CONG_ILLINOIS is not set
CONFIG_TCP_CONG_DCTCP=y
# CONFIG_TCP_CONG_CDG is not set
CONFIG_TCP_CONG_BBR=y
CONFIG_DEFAULT_BIC=y
# CONFIG_DEFAULT_CUBIC is not set
# CONFIG_DEFAULT_HTCP is not set
# CONFIG_DEFAULT_HYBLA is not set
# CONFIG_DEFAULT_VEGAS is not set
# CONFIG_DEFAULT_DCTCP is not set
# CONFIG_DEFAULT_BBR is not set
# CONFIG_DEFAULT_RENO is not set
CONFIG_DEFAULT_TCP_CONG="bic"
# CONFIG_TCP_MD5SIG is not set
CONFIG_IPV6=y
CONFIG_IPV6_ROUTER_PREF=y
CONFIG_IPV6_ROUTE_INFO=y
# CONFIG_IPV6_OPTIMISTIC_DAD is not set
CONFIG_INET6_AH=y
# CONFIG_INET6_ESP is not set
CONFIG_INET6_IPCOMP=y
# CONFIG_IPV6_MIP6 is not set
CONFIG_INET6_XFRM_TUNNEL=y
CONFIG_INET6_TUNNEL=y
CONFIG_INET6_XFRM_MODE_TRANSPORT=y
CONFIG_INET6_XFRM_MODE_TUNNEL=y
CONFIG_INET6_XFRM_MODE_BEET=y
# CONFIG_INET6_XFRM_MODE_ROUTEOPTIMIZATION is not set
CONFIG_IPV6_VTI=y
# CONFIG_IPV6_SIT is not set
CONFIG_IPV6_TUNNEL=y
CONFIG_IPV6_GRE=y
# CONFIG_IPV6_MULTIPLE_TABLES is not set
# CONFIG_IPV6_MROUTE is not set
# CONFIG_IPV6_SEG6_LWTUNNEL is not set
CONFIG_IPV6_SEG6_HMAC=y
# CONFIG_NETWORK_SECMARK is not set
CONFIG_NET_PTP_CLASSIFY=y
# CONFIG_NETWORK_PHY_TIMESTAMPING is not set
# CONFIG_NETFILTER is not set
# CONFIG_BPFILTER is not set
CONFIG_IP_DCCP=y

#
# DCCP CCIDs Configuration
#
# CONFIG_IP_DCCP_CCID2_DEBUG is not set
# CONFIG_IP_DCCP_CCID3 is not set

#
# DCCP Kernel Hacking
#
# CONFIG_IP_DCCP_DEBUG is not set
CONFIG_IP_SCTP=y
CONFIG_SCTP_DEFAULT_COOKIE_HMAC_MD5=y
# CONFIG_SCTP_DEFAULT_COOKIE_HMAC_SHA1 is not set
# CONFIG_SCTP_DEFAULT_COOKIE_HMAC_NONE is not set
CONFIG_SCTP_COOKIE_HMAC_MD5=y
# CONFIG_SCTP_COOKIE_HMAC_SHA1 is not set
CONFIG_RDS=y
CONFIG_RDS_TCP=y
# CONFIG_RDS_DEBUG is not set
# CONFIG_TIPC is not set
# CONFIG_ATM is not set
# CONFIG_L2TP is not set
CONFIG_MRP=y
# CONFIG_BRIDGE is not set
CONFIG_VLAN_8021Q=y
# CONFIG_VLAN_8021Q_GVRP is not set
CONFIG_VLAN_8021Q_MVRP=y
# CONFIG_DECNET is not set
CONFIG_LLC=y
# CONFIG_LLC2 is not set
CONFIG_ATALK=y
# CONFIG_DEV_APPLETALK is not set
CONFIG_X25=y
CONFIG_LAPB=y
CONFIG_PHONET=y
CONFIG_6LOWPAN=y
# CONFIG_6LOWPAN_DEBUGFS is not set
CONFIG_6LOWPAN_NHC=y
CONFIG_6LOWPAN_NHC_DEST=y
CONFIG_6LOWPAN_NHC_FRAGMENT=y
CONFIG_6LOWPAN_NHC_HOP=y
CONFIG_6LOWPAN_NHC_IPV6=y
# CONFIG_6LOWPAN_NHC_MOBILITY is not set
# CONFIG_6LOWPAN_NHC_ROUTING is not set
CONFIG_6LOWPAN_NHC_UDP=y
CONFIG_6LOWPAN_GHC_EXT_HDR_HOP=y
# CONFIG_6LOWPAN_GHC_UDP is not set
CONFIG_6LOWPAN_GHC_ICMPV6=y
CONFIG_6LOWPAN_GHC_EXT_HDR_DEST=y
# CONFIG_6LOWPAN_GHC_EXT_HDR_FRAG is not set
# CONFIG_6LOWPAN_GHC_EXT_HDR_ROUTE is not set
CONFIG_IEEE802154=y
CONFIG_IEEE802154_NL802154_EXPERIMENTAL=y
# CONFIG_IEEE802154_SOCKET is not set
# CONFIG_IEEE802154_6LOWPAN is not set
CONFIG_MAC802154=y
CONFIG_NET_SCHED=y

#
# Queueing/Scheduling
#
# CONFIG_NET_SCH_CBQ is not set
CONFIG_NET_SCH_HTB=y
# CONFIG_NET_SCH_HFSC is not set
CONFIG_NET_SCH_PRIO=y
# CONFIG_NET_SCH_MULTIQ is not set
CONFIG_NET_SCH_RED=y
CONFIG_NET_SCH_SFB=y
# CONFIG_NET_SCH_SFQ is not set
# CONFIG_NET_SCH_TEQL is not set
CONFIG_NET_SCH_TBF=y
CONFIG_NET_SCH_CBS=y
# CONFIG_NET_SCH_ETF is not set
CONFIG_NET_SCH_GRED=y
CONFIG_NET_SCH_DSMARK=y
# CONFIG_NET_SCH_NETEM is not set
CONFIG_NET_SCH_DRR=y
CONFIG_NET_SCH_MQPRIO=y
CONFIG_NET_SCH_SKBPRIO=y
CONFIG_NET_SCH_CHOKE=y
# CONFIG_NET_SCH_QFQ is not set
CONFIG_NET_SCH_CODEL=y
# CONFIG_NET_SCH_FQ_CODEL is not set
# CONFIG_NET_SCH_CAKE is not set
CONFIG_NET_SCH_FQ=y
# CONFIG_NET_SCH_HHF is not set
CONFIG_NET_SCH_PIE=y
CONFIG_NET_SCH_PLUG=y
CONFIG_NET_SCH_DEFAULT=y
# CONFIG_DEFAULT_FQ is not set
# CONFIG_DEFAULT_CODEL is not set
CONFIG_DEFAULT_PFIFO_FAST=y
CONFIG_DEFAULT_NET_SCH="pfifo_fast"

#
# Classification
#
CONFIG_NET_CLS=y
# CONFIG_NET_CLS_BASIC is not set
CONFIG_NET_CLS_TCINDEX=y
# CONFIG_NET_CLS_ROUTE4 is not set
# CONFIG_NET_CLS_FW is not set
CONFIG_NET_CLS_U32=y
CONFIG_CLS_U32_PERF=y
# CONFIG_CLS_U32_MARK is not set
# CONFIG_NET_CLS_RSVP is not set
CONFIG_NET_CLS_RSVP6=y
# CONFIG_NET_CLS_FLOW is not set
CONFIG_NET_CLS_BPF=y
CONFIG_NET_CLS_FLOWER=y
# CONFIG_NET_CLS_MATCHALL is not set
CONFIG_NET_EMATCH=y
CONFIG_NET_EMATCH_STACK=32
CONFIG_NET_EMATCH_CMP=y
# CONFIG_NET_EMATCH_NBYTE is not set
# CONFIG_NET_EMATCH_U32 is not set
CONFIG_NET_EMATCH_META=y
CONFIG_NET_EMATCH_TEXT=y
CONFIG_NET_EMATCH_CANID=y
# CONFIG_NET_CLS_ACT is not set
# CONFIG_NET_CLS_IND is not set
CONFIG_NET_SCH_FIFO=y
CONFIG_DCB=y
CONFIG_DNS_RESOLVER=y
CONFIG_BATMAN_ADV=y
# CONFIG_BATMAN_ADV_BATMAN_V is not set
CONFIG_BATMAN_ADV_BLA=y
CONFIG_BATMAN_ADV_DAT=y
# CONFIG_BATMAN_ADV_NC is not set
CONFIG_BATMAN_ADV_MCAST=y
# CONFIG_BATMAN_ADV_DEBUGFS is not set
CONFIG_OPENVSWITCH=y
CONFIG_VSOCKETS=y
# CONFIG_VSOCKETS_DIAG is not set
CONFIG_VIRTIO_VSOCKETS=y
CONFIG_VIRTIO_VSOCKETS_COMMON=y
# CONFIG_NETLINK_DIAG is not set
CONFIG_MPLS=y
CONFIG_NET_MPLS_GSO=y
# CONFIG_MPLS_ROUTING is not set
CONFIG_NET_NSH=y
# CONFIG_HSR is not set
# CONFIG_NET_SWITCHDEV is not set
CONFIG_NET_L3_MASTER_DEV=y
CONFIG_QRTR=y
CONFIG_QRTR_SMD=y
CONFIG_QRTR_TUN=y
CONFIG_NET_NCSI=y
CONFIG_NET_RX_BUSY_POLL=y
CONFIG_BQL=y
# CONFIG_BPF_STREAM_PARSER is not set

#
# Network testing
#
# CONFIG_NET_DROP_MONITOR is not set
CONFIG_HAMRADIO=y

#
# Packet Radio protocols
#
CONFIG_AX25=y
# CONFIG_AX25_DAMA_SLAVE is not set
CONFIG_NETROM=y
CONFIG_ROSE=y

#
# AX.25 network device drivers
#
CONFIG_BPQETHER=y
CONFIG_BAYCOM_SER_FDX=y
CONFIG_BAYCOM_SER_HDX=y
# CONFIG_YAM is not set
CONFIG_CAN=y
CONFIG_CAN_RAW=y
CONFIG_CAN_BCM=y
# CONFIG_CAN_GW is not set

#
# CAN Device Drivers
#
# CONFIG_CAN_VCAN is not set
# CONFIG_CAN_VXCAN is not set
CONFIG_CAN_DEV=y
CONFIG_CAN_CALC_BITTIMING=y
# CONFIG_CAN_AT91 is not set
# CONFIG_CAN_GRCAN is not set
# CONFIG_CAN_SUN4I is not set
# CONFIG_CAN_XILINXCAN is not set
# CONFIG_CAN_C_CAN is not set
# CONFIG_CAN_CC770 is not set
# CONFIG_CAN_IFI_CANFD is not set
# CONFIG_CAN_M_CAN is not set
# CONFIG_CAN_SJA1000 is not set
# CONFIG_CAN_SOFTING is not set

#
# CAN USB interfaces
#
# CONFIG_CAN_8DEV_USB is not set
# CONFIG_CAN_EMS_USB is not set
# CONFIG_CAN_ESD_USB2 is not set
# CONFIG_CAN_GS_USB is not set
# CONFIG_CAN_KVASER_USB is not set
# CONFIG_CAN_MCBA_USB is not set
# CONFIG_CAN_PEAK_USB is not set
# CONFIG_CAN_UCAN is not set
# CONFIG_CAN_DEBUG_DEVICES is not set
# CONFIG_BT is not set
CONFIG_AF_RXRPC=y
CONFIG_AF_RXRPC_IPV6=y
# CONFIG_AF_RXRPC_INJECT_LOSS is not set
# CONFIG_AF_RXRPC_DEBUG is not set
# CONFIG_RXKAD is not set
CONFIG_AF_KCM=y
CONFIG_STREAM_PARSER=y
# CONFIG_WIRELESS is not set
# CONFIG_WIMAX is not set
CONFIG_RFKILL=y
# CONFIG_RFKILL_INPUT is not set
CONFIG_RFKILL_GPIO=y
# CONFIG_NET_9P is not set
CONFIG_CAIF=y
# CONFIG_CAIF_DEBUG is not set
CONFIG_CAIF_NETDEV=y
# CONFIG_CAIF_USB is not set
# CONFIG_CEPH_LIB is not set
CONFIG_NFC=y
CONFIG_NFC_DIGITAL=y
CONFIG_NFC_NCI=y
CONFIG_NFC_HCI=y
CONFIG_NFC_SHDLC=y

#
# Near Field Communication (NFC) devices
#
# CONFIG_NFC_SIM is not set
# CONFIG_NFC_PORT100 is not set
CONFIG_NFC_FDP=y
CONFIG_NFC_FDP_I2C=y
# CONFIG_NFC_PN544_I2C is not set
CONFIG_NFC_PN533=y
CONFIG_NFC_PN533_USB=y
CONFIG_NFC_PN533_I2C=y
# CONFIG_NFC_MICROREAD_I2C is not set
CONFIG_NFC_MRVL=y
CONFIG_NFC_MRVL_USB=y
CONFIG_NFC_MRVL_I2C=y
CONFIG_NFC_ST21NFCA=y
CONFIG_NFC_ST21NFCA_I2C=y
CONFIG_NFC_ST_NCI=y
CONFIG_NFC_ST_NCI_I2C=y
CONFIG_NFC_NXP_NCI=y
CONFIG_NFC_NXP_NCI_I2C=y
# CONFIG_NFC_S3FWRN5_I2C is not set
CONFIG_PSAMPLE=y
# CONFIG_NET_IFE is not set
CONFIG_LWTUNNEL=y
CONFIG_LWTUNNEL_BPF=y
CONFIG_DST_CACHE=y
CONFIG_GRO_CELLS=y
CONFIG_SOCK_VALIDATE_XMIT=y
# CONFIG_NET_DEVLINK is not set
CONFIG_MAY_USE_DEVLINK=y
# CONFIG_FAILOVER is not set

#
# Device Drivers
#

#
# Generic Driver Options
#
CONFIG_UEVENT_HELPER=y
CONFIG_UEVENT_HELPER_PATH=""
# CONFIG_DEVTMPFS is not set
CONFIG_STANDALONE=y
# CONFIG_PREVENT_FIRMWARE_BUILD is not set

#
# Firmware loader
#
CONFIG_FW_LOADER=y
CONFIG_EXTRA_FIRMWARE=""
CONFIG_FW_LOADER_USER_HELPER=y
# CONFIG_FW_LOADER_USER_HELPER_FALLBACK is not set
CONFIG_WANT_DEV_COREDUMP=y
# CONFIG_ALLOW_DEV_COREDUMP is not set
CONFIG_DEBUG_DRIVER=y
# CONFIG_DEBUG_DEVRES is not set
CONFIG_DEBUG_TEST_DRIVER_REMOVE=y
CONFIG_REGMAP=y
CONFIG_REGMAP_I2C=y
CONFIG_REGMAP_W1=y
CONFIG_REGMAP_MMIO=y
CONFIG_REGMAP_IRQ=y
CONFIG_DMA_SHARED_BUFFER=y
# CONFIG_DMA_FENCE_TRACE is not set
CONFIG_DMA_CMA=y

#
# Default contiguous memory area size:
#
CONFIG_CMA_SIZE_MBYTES=16
CONFIG_CMA_SIZE_SEL_MBYTES=y
# CONFIG_CMA_SIZE_SEL_PERCENTAGE is not set
# CONFIG_CMA_SIZE_SEL_MIN is not set
# CONFIG_CMA_SIZE_SEL_MAX is not set
CONFIG_CMA_ALIGNMENT=8

#
# Bus devices
#
# CONFIG_QCOM_EBI2 is not set
# CONFIG_CONNECTOR is not set
CONFIG_GNSS=y
# CONFIG_MTD is not set
CONFIG_DTC=y
CONFIG_OF=y
CONFIG_OF_UNITTEST=y
# CONFIG_OF_ALL_DTBS is not set
CONFIG_OF_FLATTREE=y
CONFIG_OF_EARLY_FLATTREE=y
CONFIG_OF_KOBJ=y
CONFIG_OF_DYNAMIC=y
CONFIG_OF_ADDRESS=y
CONFIG_OF_IRQ=y
CONFIG_OF_RESERVED_MEM=y
CONFIG_OF_RESOLVE=y
# CONFIG_OF_OVERLAY is not set
# CONFIG_PARPORT is not set
# CONFIG_BLK_DEV is not set

#
# NVME Support
#
CONFIG_NVME_CORE=y
CONFIG_NVME_MULTIPATH=y
CONFIG_NVME_FABRICS=y
CONFIG_NVME_FC=y
# CONFIG_NVME_TARGET is not set

#
# Misc devices
#
CONFIG_AD525X_DPOT=y
# CONFIG_AD525X_DPOT_I2C is not set
CONFIG_DUMMY_IRQ=y
CONFIG_ICS932S401=y
# CONFIG_ATMEL_SSC is not set
CONFIG_ENCLOSURE_SERVICES=y
# CONFIG_QCOM_COINCELL is not set
CONFIG_APDS9802ALS=y
CONFIG_ISL29003=y
CONFIG_ISL29020=y
# CONFIG_SENSORS_TSL2550 is not set
# CONFIG_SENSORS_BH1770 is not set
# CONFIG_SENSORS_APDS990X is not set
CONFIG_HMC6352=y
CONFIG_DS1682=y
# CONFIG_USB_SWITCH_FSA9480 is not set
# CONFIG_SRAM is not set
# CONFIG_ASPEED_LPC_CTRL is not set
# CONFIG_ASPEED_LPC_SNOOP is not set
CONFIG_MISC_RTSX=y
CONFIG_C2PORT=y

#
# EEPROM support
#
CONFIG_EEPROM_AT24=y
# CONFIG_EEPROM_LEGACY is not set
CONFIG_EEPROM_MAX6875=y
# CONFIG_EEPROM_93CX6 is not set
CONFIG_EEPROM_IDT_89HPESX=y

#
# Texas Instruments shared transport line discipline
#
# CONFIG_SENSORS_LIS3_I2C is not set
# CONFIG_ALTERA_STAPL is not set

#
# Intel MIC & related support
#

#
# Intel MIC Bus Driver
#

#
# SCIF Bus Driver
#

#
# VOP Bus Driver
#

#
# Intel MIC Host Driver
#

#
# Intel MIC Card Driver
#

#
# SCIF Driver
#

#
# Intel MIC Coprocessor State Management (COSM) Drivers
#

#
# VOP Driver
#
CONFIG_ECHO=y
CONFIG_MISC_RTSX_USB=y

#
# SCSI device support
#
CONFIG_SCSI_MOD=y
CONFIG_RAID_ATTRS=y
CONFIG_SCSI=y
CONFIG_SCSI_DMA=y
CONFIG_SCSI_NETLINK=y
CONFIG_SCSI_MQ_DEFAULT=y

#
# SCSI support type (disk, tape, CD-ROM)
#
# CONFIG_BLK_DEV_SD is not set
CONFIG_CHR_DEV_ST=y
# CONFIG_CHR_DEV_OSST is not set
CONFIG_CHR_DEV_SG=y
CONFIG_CHR_DEV_SCH=y
# CONFIG_SCSI_ENCLOSURE is not set
# CONFIG_SCSI_CONSTANTS is not set
CONFIG_SCSI_LOGGING=y
CONFIG_SCSI_SCAN_ASYNC=y

#
# SCSI Transports
#
CONFIG_SCSI_SPI_ATTRS=y
CONFIG_SCSI_FC_ATTRS=y
CONFIG_SCSI_ISCSI_ATTRS=y
CONFIG_SCSI_SAS_ATTRS=y
CONFIG_SCSI_SAS_LIBSAS=y
CONFIG_SCSI_SAS_ATA=y
# CONFIG_SCSI_SAS_HOST_SMP is not set
CONFIG_SCSI_SRP_ATTRS=y
# CONFIG_SCSI_LOWLEVEL is not set
# CONFIG_SCSI_LOWLEVEL_PCMCIA is not set
CONFIG_SCSI_DH=y
# CONFIG_SCSI_DH_RDAC is not set
# CONFIG_SCSI_DH_HP_SW is not set
CONFIG_SCSI_DH_EMC=y
CONFIG_SCSI_DH_ALUA=y
# CONFIG_SCSI_OSD_INITIATOR is not set
CONFIG_ATA=y
CONFIG_ATA_VERBOSE_ERROR=y
# CONFIG_SATA_PMP is not set

#
# Controllers with non-SFF native interface
#
CONFIG_SATA_AHCI_PLATFORM=y
# CONFIG_AHCI_IMX is not set
CONFIG_AHCI_CEVA=y
# CONFIG_AHCI_QORIQ is not set
# CONFIG_SATA_GEMINI is not set
# CONFIG_ATA_SFF is not set
# CONFIG_MD is not set
CONFIG_TARGET_CORE=y
# CONFIG_TCM_IBLOCK is not set
CONFIG_TCM_FILEIO=y
CONFIG_TCM_PSCSI=y
CONFIG_TCM_USER2=y
# CONFIG_LOOPBACK_TARGET is not set
# CONFIG_ISCSI_TARGET is not set

#
# IEEE 1394 (FireWire) support
#
# CONFIG_FIREWIRE is not set
# CONFIG_NETDEVICES is not set

#
# Input device support
#
CONFIG_INPUT=y
# CONFIG_INPUT_LEDS is not set
CONFIG_INPUT_FF_MEMLESS=y
CONFIG_INPUT_POLLDEV=y
CONFIG_INPUT_SPARSEKMAP=y
CONFIG_INPUT_MATRIXKMAP=y

#
# Userland interfaces
#
CONFIG_INPUT_MOUSEDEV=y
# CONFIG_INPUT_MOUSEDEV_PSAUX is not set
CONFIG_INPUT_MOUSEDEV_SCREEN_X=1024
CONFIG_INPUT_MOUSEDEV_SCREEN_Y=768
CONFIG_INPUT_JOYDEV=y
# CONFIG_INPUT_EVDEV is not set
# CONFIG_INPUT_EVBUG is not set

#
# Input Device Drivers
#
# CONFIG_INPUT_KEYBOARD is not set
CONFIG_INPUT_MOUSE=y
# CONFIG_MOUSE_PS2 is not set
# CONFIG_MOUSE_SERIAL is not set
CONFIG_MOUSE_APPLETOUCH=y
CONFIG_MOUSE_BCM5974=y
CONFIG_MOUSE_CYAPA=y
# CONFIG_MOUSE_ELAN_I2C is not set
CONFIG_MOUSE_VSXXXAA=y
# CONFIG_MOUSE_GPIO is not set
CONFIG_MOUSE_SYNAPTICS_I2C=y
CONFIG_MOUSE_SYNAPTICS_USB=y
CONFIG_INPUT_JOYSTICK=y
CONFIG_JOYSTICK_ANALOG=y
# CONFIG_JOYSTICK_A3D is not set
# CONFIG_JOYSTICK_ADI is not set
# CONFIG_JOYSTICK_COBRA is not set
CONFIG_JOYSTICK_GF2K=y
CONFIG_JOYSTICK_GRIP=y
CONFIG_JOYSTICK_GRIP_MP=y
CONFIG_JOYSTICK_GUILLEMOT=y
CONFIG_JOYSTICK_INTERACT=y
CONFIG_JOYSTICK_SIDEWINDER=y
# CONFIG_JOYSTICK_TMDC is not set
CONFIG_JOYSTICK_IFORCE=y
# CONFIG_JOYSTICK_IFORCE_USB is not set
CONFIG_JOYSTICK_IFORCE_232=y
CONFIG_JOYSTICK_WARRIOR=y
CONFIG_JOYSTICK_MAGELLAN=y
# CONFIG_JOYSTICK_SPACEORB is not set
CONFIG_JOYSTICK_SPACEBALL=y
CONFIG_JOYSTICK_STINGER=y
# CONFIG_JOYSTICK_TWIDJOY is not set
CONFIG_JOYSTICK_ZHENHUA=y
# CONFIG_JOYSTICK_AS5011 is not set
CONFIG_JOYSTICK_JOYDUMP=y
CONFIG_JOYSTICK_XPAD=y
# CONFIG_JOYSTICK_XPAD_FF is not set
# CONFIG_JOYSTICK_XPAD_LEDS is not set
CONFIG_JOYSTICK_PXRC=y
# CONFIG_INPUT_TABLET is not set
# CONFIG_INPUT_TOUCHSCREEN is not set
CONFIG_INPUT_MISC=y
# CONFIG_INPUT_88PM860X_ONKEY is not set
# CONFIG_INPUT_88PM80X_ONKEY is not set
CONFIG_INPUT_AD714X=y
CONFIG_INPUT_AD714X_I2C=y
CONFIG_INPUT_ATMEL_CAPTOUCH=y
CONFIG_INPUT_BMA150=y
# CONFIG_INPUT_E3X0_BUTTON is not set
# CONFIG_INPUT_MAX77693_HAPTIC is not set
CONFIG_INPUT_MAX8997_HAPTIC=y
CONFIG_INPUT_MC13783_PWRBUTTON=y
# CONFIG_INPUT_MMA8450 is not set
# CONFIG_INPUT_GP2A is not set
CONFIG_INPUT_GPIO_BEEPER=y
# CONFIG_INPUT_GPIO_DECODER is not set
CONFIG_INPUT_ATI_REMOTE2=y
CONFIG_INPUT_KEYSPAN_REMOTE=y
CONFIG_INPUT_KXTJ9=y
# CONFIG_INPUT_KXTJ9_POLLED_MODE is not set
CONFIG_INPUT_POWERMATE=y
# CONFIG_INPUT_YEALINK is not set
CONFIG_INPUT_CM109=y
# CONFIG_INPUT_REGULATOR_HAPTIC is not set
CONFIG_INPUT_RETU_PWRBUTTON=y
CONFIG_INPUT_TPS65218_PWRBUTTON=y
# CONFIG_INPUT_UINPUT is not set
# CONFIG_INPUT_PCF50633_PMU is not set
CONFIG_INPUT_PCF8574=y
CONFIG_INPUT_PWM_BEEPER=y
CONFIG_INPUT_PWM_VIBRA=y
CONFIG_INPUT_GPIO_ROTARY_ENCODER=y
CONFIG_INPUT_DA9052_ONKEY=y
CONFIG_INPUT_DA9055_ONKEY=y
CONFIG_INPUT_DA9063_ONKEY=y
CONFIG_INPUT_ADXL34X=y
CONFIG_INPUT_ADXL34X_I2C=y
CONFIG_INPUT_IMS_PCU=y
# CONFIG_INPUT_CMA3000 is not set
CONFIG_INPUT_DRV260X_HAPTICS=y
CONFIG_INPUT_DRV2665_HAPTICS=y
CONFIG_INPUT_DRV2667_HAPTICS=y
# CONFIG_INPUT_HISI_POWERKEY is not set
# CONFIG_INPUT_SC27XX_VIBRA is not set
CONFIG_RMI4_CORE=y
# CONFIG_RMI4_I2C is not set
CONFIG_RMI4_SMB=y
CONFIG_RMI4_F03=y
CONFIG_RMI4_F03_SERIO=y
CONFIG_RMI4_2D_SENSOR=y
CONFIG_RMI4_F11=y
CONFIG_RMI4_F12=y
CONFIG_RMI4_F30=y
# CONFIG_RMI4_F34 is not set
# CONFIG_RMI4_F54 is not set
CONFIG_RMI4_F55=y

#
# Hardware I/O ports
#
CONFIG_SERIO=y
CONFIG_SERIO_LIBPS2=y
CONFIG_SERIO_RAW=y
# CONFIG_SERIO_ALTERA_PS2 is not set
CONFIG_SERIO_PS2MULT=y
CONFIG_SERIO_ARC_PS2=y
# CONFIG_SERIO_APBPS2 is not set
# CONFIG_SERIO_OLPC_APSP is not set
# CONFIG_SERIO_SUN4I_PS2 is not set
CONFIG_SERIO_GPIO_PS2=y
CONFIG_USERIO=y
CONFIG_GAMEPORT=y
CONFIG_GAMEPORT_NS558=y
CONFIG_GAMEPORT_L4=y

#
# Character devices
#
# CONFIG_TTY is not set
# CONFIG_DEVMEM is not set
# CONFIG_DEVKMEM is not set
# CONFIG_SERIAL_DEV_BUS is not set
CONFIG_IPMI_HANDLER=y
# CONFIG_IPMI_PANIC_EVENT is not set
CONFIG_IPMI_DEVICE_INTERFACE=y
CONFIG_IPMI_SI=y
# CONFIG_IPMI_SSIF is not set
CONFIG_IPMI_WATCHDOG=y
CONFIG_IPMI_POWEROFF=y
# CONFIG_ASPEED_KCS_IPMI_BMC is not set
# CONFIG_NPCM7XX_KCS_IPMI_BMC is not set
# CONFIG_ASPEED_BT_IPMI_BMC is not set
CONFIG_HW_RANDOM=y
# CONFIG_HW_RANDOM_TIMERIOMEM is not set
# CONFIG_HW_RANDOM_VIRTIO is not set
CONFIG_HW_RANDOM_STM32=y
CONFIG_HW_RANDOM_MESON=y
CONFIG_HW_RANDOM_MTK=y
CONFIG_HW_RANDOM_EXYNOS=y

#
# PCMCIA character devices
#
CONFIG_CARDMAN_4000=y
CONFIG_CARDMAN_4040=y
CONFIG_SCR24X=y
# CONFIG_RAW_DRIVER is not set
CONFIG_TCG_TPM=y
CONFIG_HW_RANDOM_TPM=y
CONFIG_TCG_TIS_CORE=y
CONFIG_TCG_TIS=y
CONFIG_TCG_TIS_I2C_ATMEL=y
CONFIG_TCG_TIS_I2C_INFINEON=y
CONFIG_TCG_TIS_I2C_NUVOTON=y
# CONFIG_TCG_ATMEL is not set
# CONFIG_TCG_VTPM_PROXY is not set
# CONFIG_TCG_TIS_ST33ZP24_I2C is not set
# CONFIG_XILLYBUS is not set
CONFIG_RANDOM_TRUST_BOOTLOADER=y

#
# I2C support
#
CONFIG_I2C=y
CONFIG_I2C_BOARDINFO=y
# CONFIG_I2C_COMPAT is not set
CONFIG_I2C_CHARDEV=y
CONFIG_I2C_MUX=y

#
# Multiplexer I2C Chip support
#
CONFIG_I2C_ARB_GPIO_CHALLENGE=y
CONFIG_I2C_MUX_GPIO=y
CONFIG_I2C_MUX_GPMUX=y
# CONFIG_I2C_MUX_LTC4306 is not set
# CONFIG_I2C_MUX_PCA9541 is not set
CONFIG_I2C_MUX_PCA954x=y
CONFIG_I2C_MUX_PINCTRL=y
# CONFIG_I2C_MUX_REG is not set
CONFIG_I2C_DEMUX_PINCTRL=y
CONFIG_I2C_MUX_MLXCPLD=y
# CONFIG_I2C_HELPER_AUTO is not set
# CONFIG_I2C_SMBUS is not set

#
# I2C Algorithms
#
CONFIG_I2C_ALGOBIT=y
# CONFIG_I2C_ALGOPCF is not set
CONFIG_I2C_ALGOPCA=y

#
# I2C Hardware Bus support
#
# CONFIG_I2C_HIX5HD2 is not set

#
# I2C system bus drivers (mostly embedded / system-on-chip)
#
# CONFIG_I2C_ASPEED is not set
# CONFIG_I2C_AXXIA is not set
# CONFIG_I2C_BCM_IPROC is not set
CONFIG_I2C_BRCMSTB=y
CONFIG_I2C_CADENCE=y
CONFIG_I2C_CBUS_GPIO=y
CONFIG_I2C_DESIGNWARE_CORE=y
CONFIG_I2C_DESIGNWARE_PLATFORM=y
CONFIG_I2C_DESIGNWARE_SLAVE=y
# CONFIG_I2C_EFM32 is not set
CONFIG_I2C_EMEV2=y
# CONFIG_I2C_GPIO is not set
# CONFIG_I2C_IMG is not set
# CONFIG_I2C_IMX_LPI2C is not set
# CONFIG_I2C_JZ4780 is not set
CONFIG_I2C_KEMPLD=y
# CONFIG_I2C_LPC2K is not set
# CONFIG_I2C_MESON is not set
# CONFIG_I2C_MT65XX is not set
# CONFIG_I2C_OCORES is not set
# CONFIG_I2C_OWL is not set
CONFIG_I2C_PCA_PLATFORM=y
# CONFIG_I2C_RIIC is not set
# CONFIG_I2C_RK3X is not set
# CONFIG_I2C_SH_MOBILE is not set
CONFIG_I2C_SIMTEC=y
# CONFIG_I2C_STM32F4 is not set
# CONFIG_I2C_STM32F7 is not set
# CONFIG_I2C_SUN6I_P2WI is not set
# CONFIG_I2C_SYNQUACER is not set
# CONFIG_I2C_UNIPHIER is not set
# CONFIG_I2C_UNIPHIER_F is not set
# CONFIG_I2C_VERSATILE is not set
CONFIG_I2C_XILINX=y
# CONFIG_I2C_XLP9XX is not set
# CONFIG_I2C_RCAR is not set

#
# External I2C/SMBus adapter drivers
#
CONFIG_I2C_DIOLAN_U2C=y
# CONFIG_I2C_PARPORT_LIGHT is not set
# CONFIG_I2C_ROBOTFUZZ_OSIF is not set
# CONFIG_I2C_TINY_USB is not set
# CONFIG_I2C_VIPERBOARD is not set

#
# Other I2C/SMBus bus drivers
#
CONFIG_I2C_FSI=y
CONFIG_I2C_SLAVE=y
CONFIG_I2C_SLAVE_EEPROM=y
CONFIG_I2C_DEBUG_CORE=y
# CONFIG_I2C_DEBUG_ALGO is not set
CONFIG_I2C_DEBUG_BUS=y
# CONFIG_SPI is not set
CONFIG_SPMI=y
# CONFIG_SPMI_MSM_PMIC_ARB is not set
CONFIG_HSI=y
CONFIG_HSI_BOARDINFO=y

#
# HSI controllers
#

#
# HSI clients
#
CONFIG_HSI_CHAR=y
CONFIG_PPS=y
CONFIG_PPS_DEBUG=y

#
# PPS clients support
#
CONFIG_PPS_CLIENT_KTIMER=y
CONFIG_PPS_CLIENT_GPIO=y

#
# PPS generators support
#

#
# PTP clock support
#
CONFIG_PTP_1588_CLOCK=y
CONFIG_PTP_1588_CLOCK_DTE=y

#
# Enable PHYLIB and NETWORK_PHY_TIMESTAMPING to see the additional clocks.
#
# CONFIG_PTP_1588_CLOCK_PCH is not set
CONFIG_PINCTRL=y
CONFIG_GENERIC_PINCTRL_GROUPS=y
CONFIG_PINMUX=y
CONFIG_GENERIC_PINMUX_FUNCTIONS=y
CONFIG_PINCONF=y
CONFIG_GENERIC_PINCONF=y
CONFIG_DEBUG_PINCTRL=y
CONFIG_PINCTRL_AS3722=y
# CONFIG_PINCTRL_AMD is not set
# CONFIG_PINCTRL_DA850_PUPD is not set
# CONFIG_PINCTRL_LPC18XX is not set
# CONFIG_PINCTRL_MCP23S08 is not set
# CONFIG_PINCTRL_RZA1 is not set
# CONFIG_PINCTRL_SINGLE is not set
CONFIG_PINCTRL_SX150X=y
CONFIG_PINCTRL_MAX77620=y
CONFIG_PINCTRL_INGENIC=y
CONFIG_PINCTRL_OCELOT=y
# CONFIG_PINCTRL_OWL is not set
# CONFIG_PINCTRL_ASPEED_G4 is not set
# CONFIG_PINCTRL_ASPEED_G5 is not set
# CONFIG_PINCTRL_BCM281XX is not set
# CONFIG_PINCTRL_IPROC_GPIO is not set
# CONFIG_PINCTRL_CYGNUS_MUX is not set
# CONFIG_PINCTRL_NSP_GPIO is not set
# CONFIG_PINCTRL_NS2_MUX is not set
# CONFIG_PINCTRL_NSP_MUX is not set
# CONFIG_PINCTRL_AS370 is not set
# CONFIG_PINCTRL_BERLIN_BG4CT is not set
# CONFIG_PINCTRL_PXA25X is not set
# CONFIG_PINCTRL_PXA27X is not set
# CONFIG_PINCTRL_APQ8064 is not set
# CONFIG_PINCTRL_APQ8084 is not set
# CONFIG_PINCTRL_IPQ4019 is not set
# CONFIG_PINCTRL_IPQ8064 is not set
# CONFIG_PINCTRL_IPQ8074 is not set
# CONFIG_PINCTRL_MSM8660 is not set
# CONFIG_PINCTRL_MSM8960 is not set
# CONFIG_PINCTRL_MDM9615 is not set
# CONFIG_PINCTRL_MSM8X74 is not set
# CONFIG_PINCTRL_MSM8916 is not set
# CONFIG_PINCTRL_MSM8994 is not set
# CONFIG_PINCTRL_MSM8996 is not set
# CONFIG_PINCTRL_MSM8998 is not set
# CONFIG_PINCTRL_QCOM_SPMI_PMIC is not set
# CONFIG_PINCTRL_QCOM_SSBI_PMIC is not set
# CONFIG_PINCTRL_SDM845 is not set
# CONFIG_PINCTRL_SPRD is not set
# CONFIG_PINCTRL_STM32F429 is not set
# CONFIG_PINCTRL_STM32F469 is not set
# CONFIG_PINCTRL_STM32F746 is not set
# CONFIG_PINCTRL_STM32F769 is not set
# CONFIG_PINCTRL_STM32H743 is not set
# CONFIG_PINCTRL_STM32MP157 is not set
# CONFIG_PINCTRL_TI_IODELAY is not set
CONFIG_PINCTRL_UNIPHIER=y
# CONFIG_PINCTRL_UNIPHIER_LD4 is not set
# CONFIG_PINCTRL_UNIPHIER_PRO4 is not set
# CONFIG_PINCTRL_UNIPHIER_SLD8 is not set
# CONFIG_PINCTRL_UNIPHIER_PRO5 is not set
# CONFIG_PINCTRL_UNIPHIER_PXS2 is not set
# CONFIG_PINCTRL_UNIPHIER_LD6B is not set
# CONFIG_PINCTRL_UNIPHIER_LD11 is not set
# CONFIG_PINCTRL_UNIPHIER_LD20 is not set
# CONFIG_PINCTRL_UNIPHIER_PXS3 is not set

#
# MediaTek pinctrl drivers
#
CONFIG_EINT_MTK=y
CONFIG_PINCTRL_MTK=y
# CONFIG_PINCTRL_MT2701 is not set
# CONFIG_PINCTRL_MT8135 is not set
# CONFIG_PINCTRL_MT8127 is not set
# CONFIG_PINCTRL_MT2712 is not set
# CONFIG_PINCTRL_MT7622 is not set
# CONFIG_PINCTRL_MT8173 is not set
CONFIG_PINCTRL_MT6397=y
CONFIG_PINCTRL_MADERA=y
CONFIG_PINCTRL_CS47L35=y
CONFIG_PINCTRL_CS47L85=y
CONFIG_PINCTRL_CS47L90=y
CONFIG_GPIOLIB=y
CONFIG_GPIOLIB_FASTPATH_LIMIT=512
CONFIG_OF_GPIO=y
CONFIG_GPIOLIB_IRQCHIP=y
CONFIG_DEBUG_GPIO=y
CONFIG_GPIO_SYSFS=y
CONFIG_GPIO_GENERIC=y

#
# Memory mapped GPIO drivers
#
CONFIG_GPIO_74XX_MMIO=y
CONFIG_GPIO_ALTERA=y
# CONFIG_GPIO_ASPEED is not set
# CONFIG_GPIO_ATH79 is not set
# CONFIG_GPIO_RASPBERRYPI_EXP is not set
# CONFIG_GPIO_BCM_KONA is not set
# CONFIG_GPIO_BRCMSTB is not set
# CONFIG_GPIO_CLPS711X is not set
CONFIG_GPIO_DWAPB=y
# CONFIG_GPIO_EIC_SPRD is not set
# CONFIG_GPIO_EM is not set
# CONFIG_GPIO_FTGPIO010 is not set
CONFIG_GPIO_GENERIC_PLATFORM=y
CONFIG_GPIO_GRGPIO=y
# CONFIG_GPIO_HLWD is not set
# CONFIG_GPIO_INGENIC is not set
# CONFIG_GPIO_IOP is not set
# CONFIG_GPIO_LPC18XX is not set
# CONFIG_GPIO_MB86S7X is not set
CONFIG_GPIO_MOCKUP=y
# CONFIG_GPIO_MPC8XXX is not set
# CONFIG_GPIO_MT7621 is not set
# CONFIG_GPIO_PMIC_EIC_SPRD is not set
# CONFIG_GPIO_RCAR is not set
# CONFIG_GPIO_SPRD is not set
# CONFIG_GPIO_SYSCON is not set
# CONFIG_GPIO_TEGRA is not set
# CONFIG_GPIO_TEGRA186 is not set
# CONFIG_GPIO_TS4800 is not set
# CONFIG_GPIO_UNIPHIER is not set
CONFIG_GPIO_XILINX=y
# CONFIG_GPIO_XLP is not set
# CONFIG_GPIO_ZX is not set

#
# I2C GPIO expanders
#
# CONFIG_GPIO_ADP5588 is not set
CONFIG_GPIO_ADNP=y
# CONFIG_GPIO_MAX7300 is not set
CONFIG_GPIO_MAX732X=y
# CONFIG_GPIO_MAX732X_IRQ is not set
CONFIG_GPIO_PCA953X=y
CONFIG_GPIO_PCA953X_IRQ=y
# CONFIG_GPIO_PCF857X is not set
CONFIG_GPIO_TPIC2810=y
# CONFIG_GPIO_TS4900 is not set

#
# MFD GPIO expanders
#
CONFIG_GPIO_ARIZONA=y
CONFIG_GPIO_BD9571MWV=y
# CONFIG_GPIO_DA9052 is not set
CONFIG_GPIO_DA9055=y
CONFIG_GPIO_KEMPLD=y
CONFIG_GPIO_LP3943=y
CONFIG_GPIO_LP87565=y
CONFIG_GPIO_MADERA=y
CONFIG_GPIO_MAX77620=y
# CONFIG_GPIO_RC5T583 is not set
# CONFIG_GPIO_TPS65086 is not set
# CONFIG_GPIO_TPS65218 is not set
# CONFIG_GPIO_TPS65910 is not set
CONFIG_GPIO_WM8350=y

#
# USB GPIO expanders
#
CONFIG_GPIO_VIPERBOARD=y
CONFIG_W1=y

#
# 1-wire Bus Masters
#
CONFIG_W1_MASTER_DS2490=y
CONFIG_W1_MASTER_DS2482=y
# CONFIG_W1_MASTER_MXC is not set
# CONFIG_W1_MASTER_DS1WM is not set
CONFIG_W1_MASTER_GPIO=y

#
# 1-wire Slaves
#
CONFIG_W1_SLAVE_THERM=y
CONFIG_W1_SLAVE_SMEM=y
CONFIG_W1_SLAVE_DS2405=y
CONFIG_W1_SLAVE_DS2408=y
# CONFIG_W1_SLAVE_DS2408_READBACK is not set
# CONFIG_W1_SLAVE_DS2413 is not set
CONFIG_W1_SLAVE_DS2406=y
CONFIG_W1_SLAVE_DS2423=y
CONFIG_W1_SLAVE_DS2805=y
CONFIG_W1_SLAVE_DS2431=y
CONFIG_W1_SLAVE_DS2433=y
CONFIG_W1_SLAVE_DS2433_CRC=y
CONFIG_W1_SLAVE_DS2438=y
CONFIG_W1_SLAVE_DS2780=y
CONFIG_W1_SLAVE_DS2781=y
CONFIG_W1_SLAVE_DS28E04=y
# CONFIG_W1_SLAVE_DS28E17 is not set
# CONFIG_POWER_AVS is not set
CONFIG_POWER_RESET=y
# CONFIG_POWER_RESET_AS3722 is not set
# CONFIG_POWER_RESET_BRCMKONA is not set
# CONFIG_POWER_RESET_BRCMSTB is not set
# CONFIG_POWER_RESET_GEMINI_POWEROFF is not set
# CONFIG_POWER_RESET_GPIO is not set
CONFIG_POWER_RESET_GPIO_RESTART=y
# CONFIG_POWER_RESET_OCELOT_RESET is not set
CONFIG_POWER_RESET_LTC2952=y
# CONFIG_POWER_RESET_RESTART is not set
# CONFIG_POWER_RESET_KEYSTONE is not set
CONFIG_POWER_RESET_SYSCON=y
CONFIG_POWER_RESET_SYSCON_POWEROFF=y
# CONFIG_POWER_RESET_RMOBILE is not set
# CONFIG_POWER_RESET_ZX is not set
CONFIG_REBOOT_MODE=y
CONFIG_SYSCON_REBOOT_MODE=y
# CONFIG_POWER_RESET_SC27XX is not set
CONFIG_POWER_SUPPLY=y
# CONFIG_POWER_SUPPLY_DEBUG is not set
CONFIG_PDA_POWER=y
# CONFIG_WM8350_POWER is not set
CONFIG_TEST_POWER=y
CONFIG_BATTERY_88PM860X=y
CONFIG_CHARGER_ADP5061=y
# CONFIG_BATTERY_ACT8945A is not set
CONFIG_BATTERY_DS2760=y
CONFIG_BATTERY_DS2780=y
CONFIG_BATTERY_DS2781=y
CONFIG_BATTERY_DS2782=y
CONFIG_BATTERY_SBS=y
# CONFIG_CHARGER_SBS is not set
# CONFIG_MANAGER_SBS is not set
CONFIG_BATTERY_BQ27XXX=y
CONFIG_BATTERY_BQ27XXX_I2C=y
CONFIG_BATTERY_BQ27XXX_HDQ=y
CONFIG_BATTERY_BQ27XXX_DT_UPDATES_NVM=y
# CONFIG_BATTERY_DA9052 is not set
CONFIG_BATTERY_DA9150=y
CONFIG_BATTERY_MAX17040=y
# CONFIG_BATTERY_MAX17042 is not set
CONFIG_BATTERY_MAX1721X=y
CONFIG_CHARGER_88PM860X=y
# CONFIG_CHARGER_PCF50633 is not set
CONFIG_CHARGER_ISP1704=y
CONFIG_CHARGER_MAX8903=y
CONFIG_CHARGER_LP8727=y
CONFIG_CHARGER_GPIO=y
CONFIG_CHARGER_MANAGER=y
# CONFIG_CHARGER_LTC3651 is not set
CONFIG_CHARGER_MAX14577=y
# CONFIG_CHARGER_DETECTOR_MAX14656 is not set
# CONFIG_CHARGER_MAX77693 is not set
# CONFIG_CHARGER_QCOM_SMBB is not set
CONFIG_CHARGER_BQ2415X=y
CONFIG_CHARGER_BQ24190=y
# CONFIG_CHARGER_BQ24257 is not set
CONFIG_CHARGER_BQ24735=y
CONFIG_CHARGER_BQ25890=y
CONFIG_CHARGER_SMB347=y
# CONFIG_CHARGER_TPS65090 is not set
# CONFIG_CHARGER_TPS65217 is not set
# CONFIG_BATTERY_GAUGE_LTC2941 is not set
CONFIG_BATTERY_GOLDFISH=y
# CONFIG_BATTERY_RT5033 is not set
CONFIG_CHARGER_RT9455=y
# CONFIG_HWMON is not set
CONFIG_THERMAL=y
CONFIG_THERMAL_STATISTICS=y
CONFIG_THERMAL_EMERGENCY_POWEROFF_DELAY_MS=0
# CONFIG_THERMAL_OF is not set
CONFIG_THERMAL_WRITABLE_TRIPS=y
# CONFIG_THERMAL_DEFAULT_GOV_STEP_WISE is not set
# CONFIG_THERMAL_DEFAULT_GOV_FAIR_SHARE is not set
CONFIG_THERMAL_DEFAULT_GOV_USER_SPACE=y
# CONFIG_THERMAL_DEFAULT_GOV_POWER_ALLOCATOR is not set
# CONFIG_THERMAL_GOV_FAIR_SHARE is not set
CONFIG_THERMAL_GOV_STEP_WISE=y
CONFIG_THERMAL_GOV_BANG_BANG=y
CONFIG_THERMAL_GOV_USER_SPACE=y
# CONFIG_THERMAL_GOV_POWER_ALLOCATOR is not set
# CONFIG_CLOCK_THERMAL is not set
# CONFIG_DEVFREQ_THERMAL is not set
# CONFIG_THERMAL_EMULATION is not set
CONFIG_HISI_THERMAL=y
# CONFIG_IMX_THERMAL is not set
CONFIG_MAX77620_THERMAL=y
# CONFIG_SPEAR_THERMAL is not set
# CONFIG_ROCKCHIP_THERMAL is not set
# CONFIG_RCAR_THERMAL is not set
# CONFIG_RCAR_GEN3_THERMAL is not set
# CONFIG_KIRKWOOD_THERMAL is not set
# CONFIG_DOVE_THERMAL is not set
# CONFIG_ARMADA_THERMAL is not set
CONFIG_DA9062_THERMAL=y

#
# ACPI INT340X thermal drivers
#
CONFIG_MTK_THERMAL=y

#
# Broadcom thermal drivers
#
# CONFIG_BRCMSTB_THERMAL is not set
# CONFIG_BCM_NS_THERMAL is not set

#
# Texas Instruments thermal drivers
#
# CONFIG_TI_SOC_THERMAL is not set

#
# Samsung thermal drivers
#
# CONFIG_TANGO_THERMAL is not set

#
# Qualcomm thermal drivers
#
# CONFIG_ZX2967_THERMAL is not set
CONFIG_WATCHDOG=y
CONFIG_WATCHDOG_CORE=y
# CONFIG_WATCHDOG_NOWAYOUT is not set
# CONFIG_WATCHDOG_HANDLE_BOOT_ENABLED is not set
# CONFIG_WATCHDOG_SYSFS is not set

#
# Watchdog Device Drivers
#
CONFIG_SOFT_WATCHDOG=y
CONFIG_DA9052_WATCHDOG=y
# CONFIG_DA9055_WATCHDOG is not set
CONFIG_DA9063_WATCHDOG=y
# CONFIG_DA9062_WATCHDOG is not set
CONFIG_GPIO_WATCHDOG=y
CONFIG_GPIO_WATCHDOG_ARCH_INITCALL=y
CONFIG_MENF21BMC_WATCHDOG=y
# CONFIG_TANGOX_WATCHDOG is not set
CONFIG_WM8350_WATCHDOG=y
CONFIG_XILINX_WATCHDOG=y
# CONFIG_ZIIRAVE_WATCHDOG is not set
# CONFIG_ASM9260_WATCHDOG is not set
# CONFIG_AT91RM9200_WATCHDOG is not set
# CONFIG_AT91SAM9X_WATCHDOG is not set
# CONFIG_SAMA5D4_WATCHDOG is not set
CONFIG_CADENCE_WATCHDOG=y
# CONFIG_FTWDT010_WATCHDOG is not set
# CONFIG_S3C2410_WATCHDOG is not set
CONFIG_DW_WATCHDOG=y
# CONFIG_EP93XX_WATCHDOG is not set
# CONFIG_OMAP_WATCHDOG is not set
# CONFIG_DAVINCI_WATCHDOG is not set
CONFIG_RN5T618_WATCHDOG=y
# CONFIG_SUNXI_WATCHDOG is not set
# CONFIG_NPCM7XX_WATCHDOG is not set
# CONFIG_STMP3XXX_RTC_WATCHDOG is not set
# CONFIG_NUC900_WATCHDOG is not set
# CONFIG_TS4800_WATCHDOG is not set
# CONFIG_TS72XX_WATCHDOG is not set
# CONFIG_MAX63XX_WATCHDOG is not set
CONFIG_MAX77620_WATCHDOG=y
# CONFIG_IMX2_WDT is not set
CONFIG_RETU_WATCHDOG=y
# CONFIG_MOXART_WDT is not set
CONFIG_SIRFSOC_WATCHDOG=y
# CONFIG_ST_LPC_WATCHDOG is not set
# CONFIG_TEGRA_WATCHDOG is not set
# CONFIG_QCOM_WDT is not set
# CONFIG_MESON_GXBB_WATCHDOG is not set
# CONFIG_MESON_WATCHDOG is not set
# CONFIG_MEDIATEK_WATCHDOG is not set
# CONFIG_DIGICOLOR_WATCHDOG is not set
# CONFIG_LPC18XX_WATCHDOG is not set
# CONFIG_ATLAS7_WATCHDOG is not set
# CONFIG_RENESAS_WDT is not set
# CONFIG_RENESAS_RZAWDT is not set
# CONFIG_ASPEED_WATCHDOG is not set
# CONFIG_UNIPHIER_WATCHDOG is not set
# CONFIG_RTD119X_WATCHDOG is not set
# CONFIG_SPRD_WATCHDOG is not set
# CONFIG_SC520_WDT is not set
# CONFIG_KEMPLD_WDT is not set
# CONFIG_BCM47XX_WDT is not set
# CONFIG_BCM2835_WDT is not set
# CONFIG_BCM_KONA_WDT is not set
# CONFIG_BCM_KONA_WDT_DEBUG is not set
# CONFIG_BCM7038_WDT is not set
# CONFIG_IMGPDC_WDT is not set
# CONFIG_MPC5200_WDT is not set
# CONFIG_MV64X60_WDT is not set
CONFIG_MEN_A21_WDT=y
# CONFIG_UML_WATCHDOG is not set

#
# USB-based Watchdog Cards
#
CONFIG_USBPCWATCHDOG=y

#
# Watchdog Pretimeout Governors
#
# CONFIG_WATCHDOG_PRETIMEOUT_GOV is not set
CONFIG_SSB_POSSIBLE=y
CONFIG_SSB=y
CONFIG_SSB_PCMCIAHOST_POSSIBLE=y
# CONFIG_SSB_PCMCIAHOST is not set
CONFIG_SSB_DRIVER_GPIO=y
CONFIG_BCMA_POSSIBLE=y
CONFIG_BCMA=y
CONFIG_BCMA_HOST_SOC=y
# CONFIG_BCMA_DRIVER_MIPS is not set
# CONFIG_BCMA_SFLASH is not set
# CONFIG_BCMA_DRIVER_GMAC_CMN is not set
CONFIG_BCMA_DRIVER_GPIO=y
# CONFIG_BCMA_DEBUG is not set

#
# Multifunction device drivers
#
CONFIG_MFD_CORE=y
CONFIG_MFD_ACT8945A=y
# CONFIG_MFD_SUN4I_GPADC is not set
CONFIG_MFD_AS3711=y
CONFIG_MFD_AS3722=y
# CONFIG_PMIC_ADP5520 is not set
CONFIG_MFD_AAT2870_CORE=y
# CONFIG_MFD_ATMEL_FLEXCOM is not set
# CONFIG_MFD_ATMEL_HLCDC is not set
# CONFIG_MFD_BCM590XX is not set
CONFIG_MFD_BD9571MWV=y
# CONFIG_MFD_AXP20X_I2C is not set
# CONFIG_MFD_CROS_EC is not set
CONFIG_MFD_MADERA=y
# CONFIG_MFD_MADERA_I2C is not set
CONFIG_MFD_CS47L35=y
CONFIG_MFD_CS47L85=y
CONFIG_MFD_CS47L90=y
# CONFIG_PMIC_DA903X is not set
CONFIG_PMIC_DA9052=y
CONFIG_MFD_DA9052_I2C=y
CONFIG_MFD_DA9055=y
CONFIG_MFD_DA9062=y
CONFIG_MFD_DA9063=y
CONFIG_MFD_DA9150=y
# CONFIG_MFD_DLN2 is not set
# CONFIG_MFD_EXYNOS_LPASS is not set
CONFIG_MFD_MC13XXX=y
CONFIG_MFD_MC13XXX_I2C=y
# CONFIG_MFD_MXS_LRADC is not set
# CONFIG_MFD_MX25_TSADC is not set
CONFIG_MFD_HI6421_PMIC=y
# CONFIG_MFD_HI655X_PMIC is not set
# CONFIG_HTC_PASIC3 is not set
# CONFIG_HTC_I2CPLD is not set
CONFIG_MFD_KEMPLD=y
CONFIG_MFD_88PM800=y
CONFIG_MFD_88PM805=y
CONFIG_MFD_88PM860X=y
CONFIG_MFD_MAX14577=y
CONFIG_MFD_MAX77620=y
CONFIG_MFD_MAX77686=y
CONFIG_MFD_MAX77693=y
CONFIG_MFD_MAX77843=y
CONFIG_MFD_MAX8907=y
# CONFIG_MFD_MAX8925 is not set
CONFIG_MFD_MAX8997=y
# CONFIG_MFD_MAX8998 is not set
CONFIG_MFD_MT6397=y
CONFIG_MFD_MENF21BMC=y
CONFIG_MFD_VIPERBOARD=y
CONFIG_MFD_RETU=y
CONFIG_MFD_PCF50633=y
CONFIG_PCF50633_ADC=y
CONFIG_PCF50633_GPIO=y
# CONFIG_MFD_PM8XXX is not set
# CONFIG_MFD_SPMI_PMIC is not set
CONFIG_MFD_RT5033=y
CONFIG_MFD_RC5T583=y
# CONFIG_MFD_RK808 is not set
CONFIG_MFD_RN5T618=y
CONFIG_MFD_SEC_CORE=y
# CONFIG_MFD_SI476X_CORE is not set
# CONFIG_MFD_SM501 is not set
CONFIG_MFD_SKY81452=y
# CONFIG_MFD_SMSC is not set
CONFIG_ABX500_CORE=y
# CONFIG_AB3100_CORE is not set
# CONFIG_MFD_STMPE is not set
CONFIG_MFD_SYSCON=y
CONFIG_MFD_TI_AM335X_TSCADC=y
CONFIG_MFD_LP3943=y
# CONFIG_MFD_LP8788 is not set
CONFIG_MFD_TI_LMU=y
# CONFIG_MFD_PALMAS is not set
# CONFIG_TPS6105X is not set
CONFIG_TPS65010=y
CONFIG_TPS6507X=y
CONFIG_MFD_TPS65086=y
CONFIG_MFD_TPS65090=y
CONFIG_MFD_TPS65217=y
# CONFIG_MFD_TI_LP873X is not set
CONFIG_MFD_TI_LP87565=y
CONFIG_MFD_TPS65218=y
# CONFIG_MFD_TPS6586X is not set
CONFIG_MFD_TPS65910=y
# CONFIG_MFD_TPS65912_I2C is not set
# CONFIG_MFD_TPS80031 is not set
# CONFIG_TWL4030_CORE is not set
# CONFIG_TWL6040_CORE is not set
CONFIG_MFD_WL1273_CORE=y
CONFIG_MFD_LM3533=y
# CONFIG_MFD_TC3589X is not set
CONFIG_MFD_ARIZONA=y
CONFIG_MFD_ARIZONA_I2C=y
CONFIG_MFD_CS47L24=y
CONFIG_MFD_WM5102=y
CONFIG_MFD_WM5110=y
# CONFIG_MFD_WM8997 is not set
CONFIG_MFD_WM8998=y
CONFIG_MFD_WM8400=y
# CONFIG_MFD_WM831X_I2C is not set
CONFIG_MFD_WM8350=y
CONFIG_MFD_WM8350_I2C=y
# CONFIG_MFD_WM8994 is not set
# CONFIG_MFD_STW481X is not set
CONFIG_MFD_ROHM_BD718XX=y
# CONFIG_MFD_STM32_LPTIMER is not set
# CONFIG_MFD_STM32_TIMERS is not set
CONFIG_REGULATOR=y
CONFIG_REGULATOR_DEBUG=y
CONFIG_REGULATOR_FIXED_VOLTAGE=y
# CONFIG_REGULATOR_VIRTUAL_CONSUMER is not set
# CONFIG_REGULATOR_USERSPACE_CONSUMER is not set
# CONFIG_REGULATOR_PROXY_CONSUMER is not set
CONFIG_REGULATOR_88PG86X=y
CONFIG_REGULATOR_88PM800=y
# CONFIG_REGULATOR_88PM8607 is not set
# CONFIG_REGULATOR_ACT8865 is not set
# CONFIG_REGULATOR_ACT8945A is not set
# CONFIG_REGULATOR_AD5398 is not set
# CONFIG_REGULATOR_ANATOP is not set
CONFIG_REGULATOR_AAT2870=y
CONFIG_REGULATOR_AS3711=y
CONFIG_REGULATOR_AS3722=y
# CONFIG_REGULATOR_BD718XX is not set
CONFIG_REGULATOR_BD9571MWV=y
CONFIG_REGULATOR_DA9052=y
# CONFIG_REGULATOR_DA9055 is not set
CONFIG_REGULATOR_DA9062=y
CONFIG_REGULATOR_DA9063=y
CONFIG_REGULATOR_DA9210=y
CONFIG_REGULATOR_DA9211=y
# CONFIG_REGULATOR_FAN53555 is not set
CONFIG_REGULATOR_GPIO=y
CONFIG_REGULATOR_HI6421=y
CONFIG_REGULATOR_HI6421V530=y
# CONFIG_REGULATOR_ISL9305 is not set
CONFIG_REGULATOR_ISL6271A=y
CONFIG_REGULATOR_LM363X=y
CONFIG_REGULATOR_LP3971=y
# CONFIG_REGULATOR_LP3972 is not set
# CONFIG_REGULATOR_LP872X is not set
# CONFIG_REGULATOR_LP8755 is not set
CONFIG_REGULATOR_LP87565=y
CONFIG_REGULATOR_LTC3589=y
CONFIG_REGULATOR_LTC3676=y
# CONFIG_REGULATOR_MAX14577 is not set
# CONFIG_REGULATOR_MAX1586 is not set
CONFIG_REGULATOR_MAX77620=y
# CONFIG_REGULATOR_MAX8649 is not set
CONFIG_REGULATOR_MAX8660=y
CONFIG_REGULATOR_MAX8907=y
# CONFIG_REGULATOR_MAX8952 is not set
# CONFIG_REGULATOR_MAX8997 is not set
# CONFIG_REGULATOR_MAX77686 is not set
CONFIG_REGULATOR_MAX77693=y
CONFIG_REGULATOR_MAX77802=y
CONFIG_REGULATOR_MC13XXX_CORE=y
CONFIG_REGULATOR_MC13783=y
CONFIG_REGULATOR_MC13892=y
CONFIG_REGULATOR_MT6311=y
CONFIG_REGULATOR_MT6323=y
# CONFIG_REGULATOR_MT6397 is not set
# CONFIG_REGULATOR_PBIAS is not set
CONFIG_REGULATOR_PCF50633=y
CONFIG_REGULATOR_PFUZE100=y
# CONFIG_REGULATOR_PV88060 is not set
# CONFIG_REGULATOR_PV88080 is not set
# CONFIG_REGULATOR_PV88090 is not set
# CONFIG_REGULATOR_PWM is not set
# CONFIG_REGULATOR_QCOM_RPMH is not set
CONFIG_REGULATOR_QCOM_SPMI=y
# CONFIG_REGULATOR_RC5T583 is not set
# CONFIG_REGULATOR_RN5T618 is not set
CONFIG_REGULATOR_RT5033=y
# CONFIG_REGULATOR_S2MPA01 is not set
# CONFIG_REGULATOR_S2MPS11 is not set
CONFIG_REGULATOR_S5M8767=y
# CONFIG_REGULATOR_SC2731 is not set
CONFIG_REGULATOR_SKY81452=y
# CONFIG_REGULATOR_STM32_VREFBUF is not set
# CONFIG_REGULATOR_STW481X_VMMC is not set
CONFIG_REGULATOR_SY8106A=y
CONFIG_REGULATOR_TPS51632=y
# CONFIG_REGULATOR_TPS62360 is not set
CONFIG_REGULATOR_TPS65023=y
CONFIG_REGULATOR_TPS6507X=y
CONFIG_REGULATOR_TPS65086=y
# CONFIG_REGULATOR_TPS65090 is not set
CONFIG_REGULATOR_TPS65132=y
CONFIG_REGULATOR_TPS65217=y
CONFIG_REGULATOR_TPS65218=y
CONFIG_REGULATOR_TPS65910=y
# CONFIG_REGULATOR_UNIPHIER is not set
# CONFIG_REGULATOR_VCTRL is not set
CONFIG_REGULATOR_WM8350=y
# CONFIG_REGULATOR_WM8400 is not set
CONFIG_CEC_CORE=y
CONFIG_CEC_NOTIFIER=y
# CONFIG_RC_CORE is not set
CONFIG_MEDIA_SUPPORT=y

#
# Multimedia core support
#
# CONFIG_MEDIA_CAMERA_SUPPORT is not set
CONFIG_MEDIA_ANALOG_TV_SUPPORT=y
# CONFIG_MEDIA_DIGITAL_TV_SUPPORT is not set
CONFIG_MEDIA_RADIO_SUPPORT=y
# CONFIG_MEDIA_SDR_SUPPORT is not set
# CONFIG_MEDIA_CEC_SUPPORT is not set
CONFIG_MEDIA_CONTROLLER=y
CONFIG_VIDEO_DEV=y
CONFIG_VIDEO_V4L2_SUBDEV_API=y
CONFIG_VIDEO_V4L2=y
# CONFIG_VIDEO_ADV_DEBUG is not set
# CONFIG_VIDEO_FIXED_MINOR_RANGES is not set
CONFIG_V4L2_FLASH_LED_CLASS=y
CONFIG_V4L2_FWNODE=y

#
# Media drivers
#
# CONFIG_MEDIA_USB_SUPPORT is not set

#
# Supported MMC/SDIO adapters
#
# CONFIG_RADIO_ADAPTERS is not set
# CONFIG_CYPRESS_FIRMWARE is not set
CONFIG_VIDEOBUF2_CORE=y
CONFIG_VIDEOBUF2_V4L2=y
CONFIG_VIDEOBUF2_MEMOPS=y
CONFIG_VIDEOBUF2_VMALLOC=y

#
# Media ancillary drivers (tuners, sensors, i2c, spi, frontends)
#
CONFIG_MEDIA_SUBDRV_AUTOSELECT=y

#
# I2C Encoders, decoders, sensors and other helper chips
#

#
# Audio decoders, processors and mixers
#
# CONFIG_VIDEO_TVAUDIO is not set
# CONFIG_VIDEO_TDA7432 is not set
# CONFIG_VIDEO_TDA9840 is not set
# CONFIG_VIDEO_TEA6415C is not set
CONFIG_VIDEO_TEA6420=y
CONFIG_VIDEO_MSP3400=y
# CONFIG_VIDEO_CS3308 is not set
CONFIG_VIDEO_CS5345=y
CONFIG_VIDEO_CS53L32A=y
# CONFIG_VIDEO_TLV320AIC23B is not set
# CONFIG_VIDEO_UDA1342 is not set
CONFIG_VIDEO_WM8775=y
CONFIG_VIDEO_WM8739=y
# CONFIG_VIDEO_VP27SMPX is not set
CONFIG_VIDEO_SONY_BTF_MPX=y

#
# RDS decoders
#
CONFIG_VIDEO_SAA6588=y

#
# Video decoders
#
# CONFIG_VIDEO_ADV7180 is not set
CONFIG_VIDEO_ADV7183=y
CONFIG_VIDEO_ADV748X=y
CONFIG_VIDEO_ADV7604=y
CONFIG_VIDEO_ADV7604_CEC=y
# CONFIG_VIDEO_ADV7842 is not set
# CONFIG_VIDEO_BT819 is not set
CONFIG_VIDEO_BT856=y
CONFIG_VIDEO_BT866=y
CONFIG_VIDEO_KS0127=y
CONFIG_VIDEO_ML86V7667=y
# CONFIG_VIDEO_AD5820 is not set
# CONFIG_VIDEO_AK7375 is not set
# CONFIG_VIDEO_DW9714 is not set
# CONFIG_VIDEO_DW9807_VCM is not set
CONFIG_VIDEO_SAA7110=y
CONFIG_VIDEO_SAA711X=y
CONFIG_VIDEO_TC358743=y
# CONFIG_VIDEO_TC358743_CEC is not set
# CONFIG_VIDEO_TVP514X is not set
CONFIG_VIDEO_TVP5150=y
# CONFIG_VIDEO_TVP7002 is not set
# CONFIG_VIDEO_TW2804 is not set
CONFIG_VIDEO_TW9903=y
CONFIG_VIDEO_TW9906=y
CONFIG_VIDEO_TW9910=y
CONFIG_VIDEO_VPX3220=y

#
# Video and audio decoders
#
# CONFIG_VIDEO_SAA717X is not set
CONFIG_VIDEO_CX25840=y

#
# Video encoders
#
# CONFIG_VIDEO_SAA7127 is not set
CONFIG_VIDEO_SAA7185=y
# CONFIG_VIDEO_ADV7170 is not set
CONFIG_VIDEO_ADV7175=y
# CONFIG_VIDEO_ADV7343 is not set
CONFIG_VIDEO_ADV7393=y
CONFIG_VIDEO_ADV7511=y
CONFIG_VIDEO_ADV7511_CEC=y
CONFIG_VIDEO_AD9389B=y
# CONFIG_VIDEO_AK881X is not set
# CONFIG_VIDEO_THS8200 is not set

#
# Camera sensor devices
#
# CONFIG_VIDEO_OV9650 is not set
# CONFIG_VIDEO_MT9M111 is not set
# CONFIG_VIDEO_S5K4ECGX is not set
# CONFIG_VIDEO_S5K5BAF is not set
# CONFIG_VIDEO_ET8EK8 is not set

#
# Flash devices
#

#
# Video improvement chips
#
# CONFIG_VIDEO_UPD64031A is not set
CONFIG_VIDEO_UPD64083=y

#
# Audio/Video compression chips
#
CONFIG_VIDEO_SAA6752HS=y

#
# SDR tuner chips
#

#
# Miscellaneous helper chips
#
CONFIG_VIDEO_THS7303=y
# CONFIG_VIDEO_M52790 is not set
CONFIG_VIDEO_I2C=y

#
# Sensors used on soc_camera driver
#

#
# SPI helper chips
#
CONFIG_MEDIA_TUNER=y

#
# Customize TV tuners
#
CONFIG_MEDIA_TUNER_SIMPLE=y
CONFIG_MEDIA_TUNER_TDA18250=y
CONFIG_MEDIA_TUNER_TDA8290=y
CONFIG_MEDIA_TUNER_TDA827X=y
CONFIG_MEDIA_TUNER_TDA18271=y
CONFIG_MEDIA_TUNER_TDA9887=y
CONFIG_MEDIA_TUNER_TEA5761=y
CONFIG_MEDIA_TUNER_TEA5767=y
CONFIG_MEDIA_TUNER_MT20XX=y
CONFIG_MEDIA_TUNER_MT2060=y
CONFIG_MEDIA_TUNER_MT2063=y
# CONFIG_MEDIA_TUNER_MT2266 is not set
CONFIG_MEDIA_TUNER_MT2131=y
CONFIG_MEDIA_TUNER_QT1010=y
CONFIG_MEDIA_TUNER_XC2028=y
CONFIG_MEDIA_TUNER_XC5000=y
CONFIG_MEDIA_TUNER_XC4000=y
CONFIG_MEDIA_TUNER_MXL5005S=y
# CONFIG_MEDIA_TUNER_MXL5007T is not set
CONFIG_MEDIA_TUNER_MC44S803=y
CONFIG_MEDIA_TUNER_MAX2165=y
# CONFIG_MEDIA_TUNER_TDA18218 is not set
# CONFIG_MEDIA_TUNER_FC0011 is not set
# CONFIG_MEDIA_TUNER_FC0012 is not set
# CONFIG_MEDIA_TUNER_FC0013 is not set
CONFIG_MEDIA_TUNER_TDA18212=y
CONFIG_MEDIA_TUNER_E4000=y
CONFIG_MEDIA_TUNER_FC2580=y
CONFIG_MEDIA_TUNER_M88RS6000T=y
# CONFIG_MEDIA_TUNER_TUA9001 is not set
CONFIG_MEDIA_TUNER_SI2157=y
# CONFIG_MEDIA_TUNER_IT913X is not set
# CONFIG_MEDIA_TUNER_R820T is not set
# CONFIG_MEDIA_TUNER_MXL301RF is not set
# CONFIG_MEDIA_TUNER_QM1D1C0042 is not set
CONFIG_MEDIA_TUNER_QM1D1B0004=y

#
# Customise DVB Frontends
#

#
# Tools to develop new frontends
#

#
# Graphics support
#
# CONFIG_IMX_IPUV3_CORE is not set
CONFIG_DRM=y
CONFIG_DRM_MIPI_DSI=y
CONFIG_DRM_DP_AUX_CHARDEV=y
# CONFIG_DRM_DEBUG_MM is not set
# CONFIG_DRM_DEBUG_SELFTEST is not set
CONFIG_DRM_KMS_HELPER=y
CONFIG_DRM_KMS_FB_HELPER=y
CONFIG_DRM_FBDEV_EMULATION=y
CONFIG_DRM_FBDEV_OVERALLOC=100
# CONFIG_DRM_FBDEV_LEAK_PHYS_SMEM is not set
CONFIG_DRM_LOAD_EDID_FIRMWARE=y
CONFIG_DRM_DP_CEC=y
CONFIG_DRM_TTM=y
CONFIG_DRM_GEM_CMA_HELPER=y
CONFIG_DRM_KMS_CMA_HELPER=y

#
# I2C encoder or helper chips
#
# CONFIG_DRM_I2C_CH7006 is not set
CONFIG_DRM_I2C_SIL164=y
CONFIG_DRM_I2C_NXP_TDA998X=y
CONFIG_DRM_I2C_NXP_TDA9950=y

#
# ACP (Audio CoProcessor) Configuration
#

#
# AMD Library routines
#
# CONFIG_DRM_VGEM is not set
CONFIG_DRM_VKMS=y
CONFIG_DRM_UDL=y
# CONFIG_DRM_RCAR_DW_HDMI is not set
# CONFIG_DRM_RCAR_LVDS is not set
CONFIG_DRM_VIRTIO_GPU=y
CONFIG_DRM_PANEL=y

#
# Display Panels
#
CONFIG_DRM_PANEL_ARM_VERSATILE=y
CONFIG_DRM_PANEL_LVDS=y
# CONFIG_DRM_PANEL_SIMPLE is not set
# CONFIG_DRM_PANEL_ILITEK_ILI9881C is not set
CONFIG_DRM_PANEL_INNOLUX_P079ZCA=y
# CONFIG_DRM_PANEL_JDI_LT070ME05000 is not set
CONFIG_DRM_PANEL_ORISETECH_OTM8009A=y
CONFIG_DRM_PANEL_PANASONIC_VVX10F034N00=y
CONFIG_DRM_PANEL_RASPBERRYPI_TOUCHSCREEN=y
CONFIG_DRM_PANEL_RAYDIUM_RM68200=y
CONFIG_DRM_PANEL_SAMSUNG_S6E3HA2=y
# CONFIG_DRM_PANEL_SAMSUNG_S6E63J0X03 is not set
CONFIG_DRM_PANEL_SAMSUNG_S6E8AA0=y
# CONFIG_DRM_PANEL_SEIKO_43WVF1G is not set
CONFIG_DRM_PANEL_SHARP_LQ101R1SX01=y
CONFIG_DRM_PANEL_SHARP_LS043T1LE01=y
CONFIG_DRM_BRIDGE=y
CONFIG_DRM_PANEL_BRIDGE=y

#
# Display Interface Bridges
#
# CONFIG_DRM_ANALOGIX_ANX78XX is not set
CONFIG_DRM_CDNS_DSI=y
# CONFIG_DRM_DUMB_VGA_DAC is not set
# CONFIG_DRM_LVDS_ENCODER is not set
# CONFIG_DRM_MEGACHIPS_STDPXXXX_GE_B850V3_FW is not set
CONFIG_DRM_NXP_PTN3460=y
CONFIG_DRM_PARADE_PS8622=y
# CONFIG_DRM_SIL_SII8620 is not set
CONFIG_DRM_SII902X=y
# CONFIG_DRM_SII9234 is not set
CONFIG_DRM_THINE_THC63LVD1024=y
CONFIG_DRM_TOSHIBA_TC358767=y
CONFIG_DRM_TI_TFP410=y
# CONFIG_DRM_I2C_ADV7511 is not set
# CONFIG_DRM_V3D is not set
CONFIG_DRM_ARCPGU=y
CONFIG_DRM_MXS=y
CONFIG_DRM_MXSFB=y
# CONFIG_DRM_TINYDRM is not set
# CONFIG_DRM_PL111 is not set
# CONFIG_DRM_TVE200 is not set
# CONFIG_DRM_LEGACY is not set
CONFIG_DRM_PANEL_ORIENTATION_QUIRKS=y

#
# Frame buffer Devices
#
CONFIG_FB_CMDLINE=y
CONFIG_FB_NOTIFY=y
CONFIG_FB=y
# CONFIG_FIRMWARE_EDID is not set
CONFIG_FB_CFB_FILLRECT=y
CONFIG_FB_CFB_COPYAREA=y
CONFIG_FB_CFB_IMAGEBLIT=y
CONFIG_FB_SYS_FILLRECT=y
CONFIG_FB_SYS_COPYAREA=y
CONFIG_FB_SYS_IMAGEBLIT=y
CONFIG_FB_FOREIGN_ENDIAN=y
CONFIG_FB_BOTH_ENDIAN=y
# CONFIG_FB_BIG_ENDIAN is not set
# CONFIG_FB_LITTLE_ENDIAN is not set
CONFIG_FB_SYS_FOPS=y
CONFIG_FB_DEFERRED_IO=y
CONFIG_FB_BACKLIGHT=y
CONFIG_FB_MODE_HELPERS=y
# CONFIG_FB_TILEBLITTING is not set

#
# Frame buffer hardware drivers
#
# CONFIG_FB_CLPS711X is not set
# CONFIG_FB_OPENCORES is not set
CONFIG_FB_S1D13XXX=y
# CONFIG_FB_TMIO is not set
CONFIG_FB_SMSCUFX=y
# CONFIG_FB_UDL is not set
# CONFIG_FB_IBM_GXT4500 is not set
CONFIG_FB_GOLDFISH=y
# CONFIG_FB_VIRTUAL is not set
CONFIG_FB_METRONOME=y
# CONFIG_FB_BROADSHEET is not set
# CONFIG_FB_SIMPLE is not set
CONFIG_FB_SSD1307=y
# CONFIG_FB_OMAP2 is not set
CONFIG_BACKLIGHT_LCD_SUPPORT=y
CONFIG_LCD_CLASS_DEVICE=y
# CONFIG_LCD_PLATFORM is not set
CONFIG_BACKLIGHT_CLASS_DEVICE=y
CONFIG_BACKLIGHT_GENERIC=y
CONFIG_BACKLIGHT_LM3533=y
CONFIG_BACKLIGHT_PWM=y
CONFIG_BACKLIGHT_DA9052=y
# CONFIG_BACKLIGHT_PM8941_WLED is not set
CONFIG_BACKLIGHT_ADP8860=y
CONFIG_BACKLIGHT_ADP8870=y
CONFIG_BACKLIGHT_88PM860X=y
CONFIG_BACKLIGHT_PCF50633=y
# CONFIG_BACKLIGHT_AAT2870 is not set
CONFIG_BACKLIGHT_LM3630A=y
# CONFIG_BACKLIGHT_LM3639 is not set
CONFIG_BACKLIGHT_LP855X=y
CONFIG_BACKLIGHT_SKY81452=y
CONFIG_BACKLIGHT_TPS65217=y
CONFIG_BACKLIGHT_AS3711=y
# CONFIG_BACKLIGHT_GPIO is not set
# CONFIG_BACKLIGHT_LV5207LP is not set
CONFIG_BACKLIGHT_BD6107=y
# CONFIG_BACKLIGHT_ARCXCNN is not set
CONFIG_VIDEOMODE_HELPERS=y
CONFIG_HDMI=y
CONFIG_LOGO=y
CONFIG_LOGO_LINUX_MONO=y
# CONFIG_LOGO_LINUX_VGA16 is not set
CONFIG_LOGO_LINUX_CLUT224=y
# CONFIG_SOUND is not set

#
# HID support
#
CONFIG_HID=y
# CONFIG_HID_BATTERY_STRENGTH is not set
CONFIG_HIDRAW=y
# CONFIG_UHID is not set
# CONFIG_HID_GENERIC is not set

#
# Special HID drivers
#
# CONFIG_HID_A4TECH is not set
CONFIG_HID_ACCUTOUCH=y
# CONFIG_HID_ACRUX is not set
CONFIG_HID_APPLE=y
# CONFIG_HID_APPLEIR is not set
# CONFIG_HID_ASUS is not set
# CONFIG_HID_AUREAL is not set
# CONFIG_HID_BELKIN is not set
CONFIG_HID_BETOP_FF=y
CONFIG_HID_CHERRY=y
CONFIG_HID_CHICONY=y
# CONFIG_HID_CORSAIR is not set
CONFIG_HID_COUGAR=y
CONFIG_HID_CMEDIA=y
CONFIG_HID_CP2112=y
CONFIG_HID_CYPRESS=y
CONFIG_HID_DRAGONRISE=y
CONFIG_DRAGONRISE_FF=y
CONFIG_HID_EMS_FF=y
CONFIG_HID_ELAN=y
# CONFIG_HID_ELECOM is not set
CONFIG_HID_ELO=y
CONFIG_HID_EZKEY=y
CONFIG_HID_GEMBIRD=y
# CONFIG_HID_GFRM is not set
# CONFIG_HID_HOLTEK is not set
# CONFIG_HID_GOOGLE_HAMMER is not set
# CONFIG_HID_GT683R is not set
CONFIG_HID_KEYTOUCH=y
CONFIG_HID_KYE=y
CONFIG_HID_UCLOGIC=y
CONFIG_HID_WALTOP=y
CONFIG_HID_GYRATION=y
CONFIG_HID_ICADE=y
CONFIG_HID_ITE=y
# CONFIG_HID_JABRA is not set
CONFIG_HID_TWINHAN=y
# CONFIG_HID_KENSINGTON is not set
CONFIG_HID_LCPOWER=y
CONFIG_HID_LED=y
# CONFIG_HID_LENOVO is not set
CONFIG_HID_LOGITECH=y
# CONFIG_HID_LOGITECH_DJ is not set
CONFIG_HID_LOGITECH_HIDPP=y
# CONFIG_LOGITECH_FF is not set
# CONFIG_LOGIRUMBLEPAD2_FF is not set
CONFIG_LOGIG940_FF=y
# CONFIG_LOGIWHEELS_FF is not set
CONFIG_HID_MAGICMOUSE=y
CONFIG_HID_MAYFLASH=y
CONFIG_HID_REDRAGON=y
# CONFIG_HID_MICROSOFT is not set
CONFIG_HID_MONTEREY=y
CONFIG_HID_MULTITOUCH=y
CONFIG_HID_NINTENDO=y
CONFIG_HID_NTI=y
# CONFIG_HID_NTRIG is not set
CONFIG_HID_ORTEK=y
CONFIG_HID_PANTHERLORD=y
CONFIG_PANTHERLORD_FF=y
# CONFIG_HID_PENMOUNT is not set
# CONFIG_HID_PETALYNX is not set
CONFIG_HID_PICOLCD=y
CONFIG_HID_PICOLCD_FB=y
CONFIG_HID_PICOLCD_BACKLIGHT=y
# CONFIG_HID_PICOLCD_LCD is not set
CONFIG_HID_PICOLCD_LEDS=y
CONFIG_HID_PLANTRONICS=y
CONFIG_HID_PRIMAX=y
# CONFIG_HID_RETRODE is not set
CONFIG_HID_ROCCAT=y
# CONFIG_HID_SAITEK is not set
CONFIG_HID_SAMSUNG=y
CONFIG_HID_SONY=y
CONFIG_SONY_FF=y
CONFIG_HID_SPEEDLINK=y
# CONFIG_HID_STEAM is not set
CONFIG_HID_STEELSERIES=y
# CONFIG_HID_SUNPLUS is not set
CONFIG_HID_RMI=y
# CONFIG_HID_GREENASIA is not set
# CONFIG_HID_SMARTJOYPLUS is not set
CONFIG_HID_TIVO=y
CONFIG_HID_TOPSEED=y
CONFIG_HID_THINGM=y
CONFIG_HID_THRUSTMASTER=y
# CONFIG_THRUSTMASTER_FF is not set
# CONFIG_HID_UDRAW_PS3 is not set
# CONFIG_HID_WACOM is not set
CONFIG_HID_WIIMOTE=y
CONFIG_HID_XINMO=y
# CONFIG_HID_ZEROPLUS is not set
CONFIG_HID_ZYDACRON=y
CONFIG_HID_SENSOR_HUB=y
CONFIG_HID_SENSOR_CUSTOM_SENSOR=y
CONFIG_HID_ALPS=y

#
# USB HID support
#
CONFIG_USB_HID=y
CONFIG_HID_PID=y
CONFIG_USB_HIDDEV=y

#
# I2C HID support
#
# CONFIG_I2C_HID is not set
CONFIG_USB_OHCI_LITTLE_ENDIAN=y
CONFIG_USB_SUPPORT=y
CONFIG_USB_COMMON=y
CONFIG_USB_ARCH_HAS_HCD=y
CONFIG_USB=y
# CONFIG_USB_ANNOUNCE_NEW_DEVICES is not set

#
# Miscellaneous USB options
#
CONFIG_USB_DEFAULT_PERSIST=y
CONFIG_USB_DYNAMIC_MINORS=y
# CONFIG_USB_OTG_WHITELIST is not set
# CONFIG_USB_OTG_BLACKLIST_HUB is not set
CONFIG_USB_MON=y
# CONFIG_USB_WUSB_CBAF is not set

#
# USB Host Controller Drivers
#
CONFIG_USB_C67X00_HCD=y
CONFIG_USB_XHCI_HCD=y
CONFIG_USB_XHCI_PLATFORM=y
# CONFIG_USB_XHCI_HISTB is not set
# CONFIG_USB_XHCI_MTK is not set
# CONFIG_USB_XHCI_MVEBU is not set
# CONFIG_USB_XHCI_RCAR is not set
CONFIG_USB_EHCI_HCD=y
CONFIG_USB_EHCI_ROOT_HUB_TT=y
CONFIG_USB_EHCI_TT_NEWSCHED=y
# CONFIG_USB_EHCI_HCD_NPCM7XX is not set
CONFIG_USB_EHCI_HCD_PLATFORM=y
CONFIG_USB_OXU210HP_HCD=y
CONFIG_USB_ISP116X_HCD=y
# CONFIG_USB_ISP1362_HCD is not set
CONFIG_USB_FOTG210_HCD=y
# CONFIG_USB_OHCI_HCD is not set
CONFIG_USB_U132_HCD=y
CONFIG_USB_SL811_HCD=y
# CONFIG_USB_SL811_HCD_ISO is not set
CONFIG_USB_SL811_CS=y
CONFIG_USB_R8A66597_HCD=y
CONFIG_USB_HCD_BCMA=y
CONFIG_USB_HCD_SSB=y
# CONFIG_USB_HCD_TEST_MODE is not set

#
# USB Device Class drivers
#
CONFIG_USB_PRINTER=y
CONFIG_USB_WDM=y
# CONFIG_USB_TMC is not set

#
# NOTE: USB_STORAGE depends on SCSI but BLK_DEV_SD may
#

#
# also be needed; see USB_STORAGE Help for more info
#
CONFIG_USB_STORAGE=y
CONFIG_USB_STORAGE_DEBUG=y
CONFIG_USB_STORAGE_REALTEK=y
# CONFIG_USB_STORAGE_DATAFAB is not set
# CONFIG_USB_STORAGE_FREECOM is not set
# CONFIG_USB_STORAGE_ISD200 is not set
# CONFIG_USB_STORAGE_USBAT is not set
CONFIG_USB_STORAGE_SDDR09=y
CONFIG_USB_STORAGE_SDDR55=y
# CONFIG_USB_STORAGE_JUMPSHOT is not set
CONFIG_USB_STORAGE_ALAUDA=y
CONFIG_USB_STORAGE_ONETOUCH=y
CONFIG_USB_STORAGE_KARMA=y
CONFIG_USB_STORAGE_CYPRESS_ATACB=y
CONFIG_USB_STORAGE_ENE_UB6250=y
CONFIG_USB_UAS=y

#
# USB Imaging devices
#
CONFIG_USB_MDC800=y
CONFIG_USB_MICROTEK=y
CONFIG_USBIP_CORE=y
CONFIG_USBIP_VHCI_HCD=y
CONFIG_USBIP_VHCI_HC_PORTS=8
CONFIG_USBIP_VHCI_NR_HCS=1
CONFIG_USBIP_HOST=y
CONFIG_USBIP_DEBUG=y
# CONFIG_USB_MTU3 is not set
CONFIG_USB_MUSB_HDRC=y
CONFIG_USB_MUSB_HOST=y

#
# Platform Glue Layer
#
# CONFIG_USB_MUSB_DSPS is not set
# CONFIG_USB_MUSB_UX500 is not set

#
# MUSB DMA mode
#
CONFIG_MUSB_PIO_ONLY=y
CONFIG_USB_DWC3=y
CONFIG_USB_DWC3_ULPI=y
CONFIG_USB_DWC3_HOST=y

#
# Platform Glue Driver Support
#
CONFIG_USB_DWC3_OMAP=y
CONFIG_USB_DWC3_EXYNOS=y
CONFIG_USB_DWC3_KEYSTONE=y
CONFIG_USB_DWC3_OF_SIMPLE=y
CONFIG_USB_DWC3_ST=y
CONFIG_USB_DWC3_QCOM=y
CONFIG_USB_DWC2=y
CONFIG_USB_DWC2_HOST=y

#
# Gadget/Dual-role mode requires USB Gadget support to be enabled
#
CONFIG_USB_DWC2_DEBUG=y
# CONFIG_USB_DWC2_VERBOSE is not set
CONFIG_USB_DWC2_TRACK_MISSED_SOFS=y
CONFIG_USB_DWC2_DEBUG_PERIODIC=y
CONFIG_USB_CHIPIDEA=y
CONFIG_USB_CHIPIDEA_OF=y
CONFIG_USB_CHIPIDEA_HOST=y
CONFIG_USB_ISP1760=y
CONFIG_USB_ISP1760_HCD=y
CONFIG_USB_ISP1760_HOST_ROLE=y

#
# USB port drivers
#

#
# USB Miscellaneous drivers
#
CONFIG_USB_EMI62=y
CONFIG_USB_EMI26=y
CONFIG_USB_ADUTUX=y
# CONFIG_USB_SEVSEG is not set
# CONFIG_USB_LEGOTOWER is not set
# CONFIG_USB_LCD is not set
# CONFIG_USB_CYPRESS_CY7C63 is not set
CONFIG_USB_CYTHERM=y
CONFIG_USB_IDMOUSE=y
CONFIG_USB_FTDI_ELAN=y
# CONFIG_USB_APPLEDISPLAY is not set
CONFIG_USB_SISUSBVGA=y
# CONFIG_USB_LD is not set
CONFIG_USB_TRANCEVIBRATOR=y
CONFIG_USB_IOWARRIOR=y
# CONFIG_USB_TEST is not set
# CONFIG_USB_EHSET_TEST_FIXTURE is not set
CONFIG_USB_ISIGHTFW=y
CONFIG_USB_YUREX=y
# CONFIG_USB_EZUSB_FX2 is not set
CONFIG_USB_HUB_USB251XB=y
# CONFIG_USB_HSIC_USB3503 is not set
CONFIG_USB_HSIC_USB4604=y
# CONFIG_USB_LINK_LAYER_TEST is not set
# CONFIG_USB_CHAOSKEY is not set

#
# USB Physical Layer drivers
#
CONFIG_USB_PHY=y
# CONFIG_NOP_USB_XCEIV is not set
CONFIG_USB_GPIO_VBUS=y
CONFIG_TAHVO_USB=y
# CONFIG_TAHVO_USB_HOST_BY_DEFAULT is not set
# CONFIG_USB_ISP1301 is not set
# CONFIG_USB_GADGET is not set
# CONFIG_TYPEC is not set
CONFIG_USB_ROLE_SWITCH=y
CONFIG_USB_ULPI_BUS=y
# CONFIG_UWB is not set
# CONFIG_MMC is not set
CONFIG_MEMSTICK=y
# CONFIG_MEMSTICK_DEBUG is not set

#
# MemoryStick drivers
#
# CONFIG_MEMSTICK_UNSAFE_RESUME is not set
CONFIG_MSPRO_BLOCK=y
CONFIG_MS_BLOCK=y

#
# MemoryStick Host Controller Drivers
#
CONFIG_MEMSTICK_REALTEK_USB=y
CONFIG_NEW_LEDS=y
CONFIG_LEDS_CLASS=y
CONFIG_LEDS_CLASS_FLASH=y
CONFIG_LEDS_BRIGHTNESS_HW_CHANGED=y

#
# LED drivers
#
CONFIG_LEDS_88PM860X=y
# CONFIG_LEDS_AAT1290 is not set
CONFIG_LEDS_AS3645A=y
CONFIG_LEDS_BCM6328=y
CONFIG_LEDS_BCM6358=y
CONFIG_LEDS_LM3530=y
CONFIG_LEDS_LM3533=y
CONFIG_LEDS_LM3642=y
CONFIG_LEDS_LM3692X=y
CONFIG_LEDS_LM3601X=y
CONFIG_LEDS_MT6323=y
CONFIG_LEDS_PCA9532=y
# CONFIG_LEDS_PCA9532_GPIO is not set
CONFIG_LEDS_GPIO=y
CONFIG_LEDS_LP3944=y
# CONFIG_LEDS_LP3952 is not set
# CONFIG_LEDS_LP5521 is not set
# CONFIG_LEDS_LP5523 is not set
# CONFIG_LEDS_LP5562 is not set
# CONFIG_LEDS_LP8501 is not set
# CONFIG_LEDS_LP8860 is not set
CONFIG_LEDS_PCA955X=y
# CONFIG_LEDS_PCA955X_GPIO is not set
CONFIG_LEDS_PCA963X=y
CONFIG_LEDS_WM8350=y
# CONFIG_LEDS_DA9052 is not set
CONFIG_LEDS_PWM=y
CONFIG_LEDS_REGULATOR=y
# CONFIG_LEDS_BD2802 is not set
CONFIG_LEDS_LT3593=y
# CONFIG_LEDS_MC13783 is not set
CONFIG_LEDS_TCA6507=y
# CONFIG_LEDS_TLC591XX is not set
CONFIG_LEDS_MAX77693=y
# CONFIG_LEDS_MAX8997 is not set
CONFIG_LEDS_LM355x=y
# CONFIG_LEDS_OT200 is not set
CONFIG_LEDS_MENF21BMC=y
CONFIG_LEDS_KTD2692=y
CONFIG_LEDS_IS31FL319X=y
CONFIG_LEDS_IS31FL32XX=y

#
# LED driver for blink(1) USB RGB LED is under Special HID drivers (HID_THINGM)
#
CONFIG_LEDS_BLINKM=y
CONFIG_LEDS_SYSCON=y
CONFIG_LEDS_MLXREG=y
CONFIG_LEDS_USER=y

#
# LED Triggers
#
# CONFIG_LEDS_TRIGGERS is not set
# CONFIG_ACCESSIBILITY is not set
# CONFIG_INFINIBAND is not set
CONFIG_RTC_LIB=y
CONFIG_RTC_CLASS=y
# CONFIG_RTC_HCTOSYS is not set
CONFIG_RTC_SYSTOHC=y
CONFIG_RTC_SYSTOHC_DEVICE="rtc0"
# CONFIG_RTC_DEBUG is not set
CONFIG_RTC_NVMEM=y

#
# RTC interfaces
#
# CONFIG_RTC_INTF_SYSFS is not set
# CONFIG_RTC_INTF_DEV is not set
CONFIG_RTC_DRV_TEST=y

#
# I2C RTC drivers
#
CONFIG_RTC_DRV_88PM860X=y
CONFIG_RTC_DRV_88PM80X=y
# CONFIG_RTC_DRV_ABB5ZES3 is not set
CONFIG_RTC_DRV_ABX80X=y
# CONFIG_RTC_DRV_BRCMSTB is not set
CONFIG_RTC_DRV_AS3722=y
# CONFIG_RTC_DRV_DS1307 is not set
CONFIG_RTC_DRV_DS1374=y
CONFIG_RTC_DRV_DS1374_WDT=y
# CONFIG_RTC_DRV_DS1672 is not set
# CONFIG_RTC_DRV_HYM8563 is not set
CONFIG_RTC_DRV_MAX6900=y
# CONFIG_RTC_DRV_MAX8907 is not set
CONFIG_RTC_DRV_MAX8997=y
CONFIG_RTC_DRV_MAX77686=y
CONFIG_RTC_DRV_RS5C372=y
CONFIG_RTC_DRV_ISL1208=y
# CONFIG_RTC_DRV_ISL12022 is not set
# CONFIG_RTC_DRV_ISL12026 is not set
# CONFIG_RTC_DRV_X1205 is not set
# CONFIG_RTC_DRV_PCF8523 is not set
# CONFIG_RTC_DRV_PCF85063 is not set
CONFIG_RTC_DRV_PCF85363=y
CONFIG_RTC_DRV_PCF8563=y
CONFIG_RTC_DRV_PCF8583=y
# CONFIG_RTC_DRV_M41T80 is not set
CONFIG_RTC_DRV_BQ32K=y
# CONFIG_RTC_DRV_TPS65910 is not set
# CONFIG_RTC_DRV_RC5T583 is not set
CONFIG_RTC_DRV_S35390A=y
CONFIG_RTC_DRV_FM3130=y
# CONFIG_RTC_DRV_RX8010 is not set
CONFIG_RTC_DRV_RX8581=y
CONFIG_RTC_DRV_RX8025=y
CONFIG_RTC_DRV_EM3027=y
CONFIG_RTC_DRV_RV8803=y
CONFIG_RTC_DRV_S5M=y

#
# SPI RTC drivers
#
CONFIG_RTC_I2C_AND_SPI=y

#
# SPI and I2C RTC drivers
#
CONFIG_RTC_DRV_DS3232=y
CONFIG_RTC_DRV_PCF2127=y
CONFIG_RTC_DRV_RV3029C2=y

#
# Platform RTC drivers
#
CONFIG_RTC_DRV_DS1286=y
CONFIG_RTC_DRV_DS1511=y
CONFIG_RTC_DRV_DS1553=y
CONFIG_RTC_DRV_DS1685_FAMILY=y
# CONFIG_RTC_DRV_DS1685 is not set
# CONFIG_RTC_DRV_DS1689 is not set
# CONFIG_RTC_DRV_DS17285 is not set
# CONFIG_RTC_DRV_DS17485 is not set
CONFIG_RTC_DRV_DS17885=y
# CONFIG_RTC_DRV_DS1742 is not set
# CONFIG_RTC_DRV_DS2404 is not set
CONFIG_RTC_DRV_DA9052=y
CONFIG_RTC_DRV_DA9055=y
CONFIG_RTC_DRV_DA9063=y
CONFIG_RTC_DRV_STK17TA8=y
# CONFIG_RTC_DRV_M48T86 is not set
CONFIG_RTC_DRV_M48T35=y
CONFIG_RTC_DRV_M48T59=y
CONFIG_RTC_DRV_MSM6242=y
# CONFIG_RTC_DRV_BQ4802 is not set
CONFIG_RTC_DRV_RP5C01=y
CONFIG_RTC_DRV_V3020=y
CONFIG_RTC_DRV_WM8350=y
# CONFIG_RTC_DRV_SC27XX is not set
CONFIG_RTC_DRV_SPEAR=y
CONFIG_RTC_DRV_PCF50633=y
# CONFIG_RTC_DRV_NUC900 is not set
# CONFIG_RTC_DRV_ZYNQMP is not set

#
# on-CPU RTC drivers
#
# CONFIG_RTC_DRV_ASM9260 is not set
# CONFIG_RTC_DRV_DAVINCI is not set
# CONFIG_RTC_DRV_DIGICOLOR is not set
# CONFIG_RTC_DRV_OMAP is not set
# CONFIG_RTC_DRV_S3C is not set
# CONFIG_RTC_DRV_EP93XX is not set
# CONFIG_RTC_DRV_VR41XX is not set
# CONFIG_RTC_DRV_AT91RM9200 is not set
# CONFIG_RTC_DRV_AT91SAM9 is not set
# CONFIG_RTC_DRV_GENERIC is not set
# CONFIG_RTC_DRV_VT8500 is not set
# CONFIG_RTC_DRV_SUN6I is not set
# CONFIG_RTC_DRV_SUNXI is not set
# CONFIG_RTC_DRV_TX4939 is not set
# CONFIG_RTC_DRV_MV is not set
# CONFIG_RTC_DRV_ARMADA38X is not set
CONFIG_RTC_DRV_FTRTC010=y
# CONFIG_RTC_DRV_COH901331 is not set
# CONFIG_RTC_DRV_STMP is not set
CONFIG_RTC_DRV_MC13XXX=y
# CONFIG_RTC_DRV_JZ4740 is not set
# CONFIG_RTC_DRV_LPC24XX is not set
# CONFIG_RTC_DRV_LPC32XX is not set
# CONFIG_RTC_DRV_PM8XXX is not set
# CONFIG_RTC_DRV_TEGRA is not set
# CONFIG_RTC_DRV_SNVS is not set
# CONFIG_RTC_DRV_MOXART is not set
# CONFIG_RTC_DRV_MT6397 is not set
# CONFIG_RTC_DRV_MT7622 is not set
# CONFIG_RTC_DRV_XGENE is not set
CONFIG_RTC_DRV_R7301=y
# CONFIG_RTC_DRV_STM32 is not set
# CONFIG_RTC_DRV_RTD119X is not set

#
# HID Sensor RTC drivers
#
# CONFIG_RTC_DRV_HID_SENSOR_TIME is not set
# CONFIG_DMADEVICES is not set

#
# DMABUF options
#
CONFIG_SYNC_FILE=y
# CONFIG_SW_SYNC is not set
CONFIG_AUXDISPLAY=y
CONFIG_HD44780=y
# CONFIG_IMG_ASCII_LCD is not set
CONFIG_HT16K33=y
CONFIG_CHARLCD=y
CONFIG_UIO=y
# CONFIG_UIO_PDRV_GENIRQ is not set
# CONFIG_UIO_DMEM_GENIRQ is not set
CONFIG_UIO_PRUSS=y
CONFIG_VIRT_DRIVERS=y
CONFIG_VIRTIO=y
CONFIG_VIRTIO_MENU=y
CONFIG_VIRTIO_BALLOON=y
CONFIG_VIRTIO_INPUT=y
# CONFIG_VIRTIO_MMIO is not set

#
# Microsoft Hyper-V guest support
#
# CONFIG_STAGING is not set
# CONFIG_CHROME_PLATFORMS is not set
# CONFIG_MELLANOX_PLATFORM is not set
CONFIG_CLKDEV_LOOKUP=y
CONFIG_HAVE_CLK_PREPARE=y
CONFIG_COMMON_CLK=y

#
# Common Clock Framework
#
# CONFIG_COMMON_CLK_VERSATILE is not set
# CONFIG_CLK_HSDK is not set
CONFIG_COMMON_CLK_MAX77686=y
CONFIG_COMMON_CLK_MAX9485=y
# CONFIG_COMMON_CLK_HI655X is not set
# CONFIG_COMMON_CLK_SCMI is not set
# CONFIG_COMMON_CLK_SCPI is not set
CONFIG_COMMON_CLK_SI5351=y
CONFIG_COMMON_CLK_SI514=y
CONFIG_COMMON_CLK_SI544=y
CONFIG_COMMON_CLK_SI570=y
CONFIG_COMMON_CLK_CDCE706=y
# CONFIG_COMMON_CLK_CDCE925 is not set
CONFIG_COMMON_CLK_CS2000_CP=y
# CONFIG_COMMON_CLK_GEMINI is not set
# CONFIG_COMMON_CLK_ASPEED is not set
CONFIG_COMMON_CLK_S2MPS11=y
# CONFIG_COMMON_CLK_AXI_CLKGEN is not set
# CONFIG_CLK_QORIQ is not set
CONFIG_COMMON_CLK_XGENE=y
CONFIG_COMMON_CLK_PWM=y
# CONFIG_COMMON_CLK_OXNAS is not set
CONFIG_COMMON_CLK_VC5=y
# CONFIG_CLK_ACTIONS is not set
# CONFIG_CLK_BCM_63XX is not set
# CONFIG_CLK_BCM_KONA is not set
# CONFIG_CLK_BCM_CYGNUS is not set
# CONFIG_CLK_BCM_HR2 is not set
# CONFIG_CLK_BCM_NSP is not set
# CONFIG_CLK_BCM_NS2 is not set
# CONFIG_CLK_BCM_SR is not set
# CONFIG_COMMON_CLK_HI3516CV300 is not set
# CONFIG_COMMON_CLK_HI3519 is not set
# CONFIG_COMMON_CLK_HI3660 is not set
# CONFIG_COMMON_CLK_HI3798CV200 is not set
# CONFIG_COMMON_CLK_HI6220 is not set
# CONFIG_RESET_HISI is not set
# CONFIG_STUB_CLK_HI6220 is not set
# CONFIG_STUB_CLK_HI3660 is not set
# CONFIG_COMMON_CLK_BOSTON is not set
# CONFIG_COMMON_CLK_KEYSTONE is not set

#
# Clock driver for MediaTek SoC
#
# CONFIG_COMMON_CLK_MT2701 is not set
# CONFIG_COMMON_CLK_MT2712 is not set
# CONFIG_COMMON_CLK_MT6797 is not set
# CONFIG_COMMON_CLK_MT7622 is not set
# CONFIG_COMMON_CLK_MT8135 is not set
# CONFIG_COMMON_CLK_MT8173 is not set
# CONFIG_COMMON_CLK_QCOM is not set
# CONFIG_SPMI_PMIC_CLKDIV is not set
# CONFIG_CLK_RENESAS is not set
# CONFIG_COMMON_CLK_SAMSUNG is not set
# CONFIG_S3C2410_COMMON_CLK is not set
# CONFIG_S3C2412_COMMON_CLK is not set
# CONFIG_S3C2443_COMMON_CLK is not set
# CONFIG_SPRD_COMMON_CLK is not set
# CONFIG_SUNXI_CCU is not set
# CONFIG_COMMON_CLK_TI_ADPLL is not set
# CONFIG_CLK_UNIPHIER is not set
# CONFIG_HWSPINLOCK is not set

#
# Clock Source drivers
#
# CONFIG_BCM2835_TIMER is not set
# CONFIG_BCM_KONA_TIMER is not set
# CONFIG_DIGICOLOR_TIMER is not set
# CONFIG_DW_APB_TIMER is not set
# CONFIG_FTTMR010_TIMER is not set
# CONFIG_MESON6_TIMER is not set
# CONFIG_OWL_TIMER is not set
# CONFIG_SUN4I_TIMER is not set
# CONFIG_SUN5I_HSTIMER is not set
# CONFIG_VT8500_TIMER is not set
# CONFIG_NPCM7XX_TIMER is not set
# CONFIG_CADENCE_TTC_TIMER is not set
# CONFIG_ASM9260_TIMER is not set
# CONFIG_CLKSRC_DBX500_PRCMU is not set
# CONFIG_CLPS711X_TIMER is not set
# CONFIG_ATLAS7_TIMER is not set
# CONFIG_MXS_TIMER is not set
# CONFIG_PRIMA2_TIMER is not set
# CONFIG_NSPIRE_TIMER is not set
# CONFIG_INTEGRATOR_AP_TIMER is not set
# CONFIG_CLKSRC_PISTACHIO is not set
# CONFIG_CLKSRC_TI_32K is not set
# CONFIG_CLKSRC_NPS is not set
# CONFIG_CLKSRC_MPS2 is not set
# CONFIG_ARC_TIMERS is not set
# CONFIG_ARM_TIMER_SP804 is not set
# CONFIG_ARMV7M_SYSTICK is not set
# CONFIG_ATMEL_ST is not set
# CONFIG_CLKSRC_SAMSUNG_PWM is not set
# CONFIG_FSL_FTM_TIMER is not set
# CONFIG_OXNAS_RPS_TIMER is not set
# CONFIG_MTK_TIMER is not set
# CONFIG_SPRD_TIMER is not set
# CONFIG_CLKSRC_JCORE_PIT is not set
# CONFIG_SH_TIMER_CMT is not set
# CONFIG_SH_TIMER_MTU2 is not set
# CONFIG_RENESAS_OSTM is not set
# CONFIG_SH_TIMER_TMU is not set
# CONFIG_EM_TIMER_STI is not set
# CONFIG_CLKSRC_VERSATILE is not set
# CONFIG_CLKSRC_PXA is not set
# CONFIG_H8300_TMR8 is not set
# CONFIG_H8300_TMR16 is not set
# CONFIG_H8300_TPU is not set
# CONFIG_CLKSRC_ST_LPC is not set
# CONFIG_ATCPIT100_TIMER is not set
CONFIG_MAILBOX=y
# CONFIG_IMX_MBOX is not set
# CONFIG_PLATFORM_MHU is not set
# CONFIG_ROCKCHIP_MBOX is not set
# CONFIG_ALTERA_MBOX is not set
# CONFIG_HI3660_MBOX is not set
# CONFIG_HI6220_MBOX is not set
# CONFIG_MAILBOX_TEST is not set
# CONFIG_QCOM_APCS_IPC is not set
# CONFIG_BCM_PDC_MBOX is not set
# CONFIG_MTK_CMDQ_MBOX is not set
# CONFIG_IOMMU_SUPPORT is not set

#
# Remoteproc drivers
#
CONFIG_REMOTEPROC=y

#
# Rpmsg drivers
#
CONFIG_RPMSG=y
CONFIG_RPMSG_CHAR=y
CONFIG_RPMSG_QCOM_GLINK_NATIVE=y
CONFIG_RPMSG_QCOM_GLINK_RPM=y
CONFIG_RPMSG_VIRTIO=y

#
# SOC (System On Chip) specific Drivers
#

#
# Amlogic SoC drivers
#
# CONFIG_MESON_GX_SOCINFO is not set
# CONFIG_MESON_MX_SOCINFO is not set
# CONFIG_AT91_SOC_ID is not set

#
# Broadcom SoC drivers
#
# CONFIG_SOC_BRCMSTB is not set

#
# NXP/Freescale QorIQ SoC drivers
#

#
# i.MX SoC drivers
#

#
# MediaTek SoC drivers
#
# CONFIG_MTK_INFRACFG is not set
# CONFIG_MTK_PMIC_WRAP is not set
# CONFIG_MTK_SCPSYS is not set

#
# Qualcomm SoC drivers
#
# CONFIG_QCOM_COMMAND_DB is not set
# CONFIG_QCOM_GENI_SE is not set
# CONFIG_QCOM_RPMH is not set
# CONFIG_SOC_RENESAS is not set
CONFIG_ROCKCHIP_GRF=y
# CONFIG_SOC_SAMSUNG is not set
# CONFIG_SOC_TI is not set
# CONFIG_UX500_SOC_ID is not set

#
# Xilinx SoC drivers
#
CONFIG_XILINX_VCU=y
# CONFIG_SOC_ZTE is not set
CONFIG_PM_DEVFREQ=y

#
# DEVFREQ Governors
#
CONFIG_DEVFREQ_GOV_SIMPLE_ONDEMAND=y
# CONFIG_DEVFREQ_GOV_PERFORMANCE is not set
CONFIG_DEVFREQ_GOV_POWERSAVE=y
CONFIG_DEVFREQ_GOV_USERSPACE=y
# CONFIG_DEVFREQ_GOV_PASSIVE is not set

#
# DEVFREQ Drivers
#
# CONFIG_ARM_EXYNOS_BUS_DEVFREQ is not set
CONFIG_PM_DEVFREQ_EVENT=y
# CONFIG_DEVFREQ_EVENT_EXYNOS_NOCP is not set
# CONFIG_DEVFREQ_EVENT_EXYNOS_PPMU is not set
# CONFIG_DEVFREQ_EVENT_ROCKCHIP_DFI is not set
CONFIG_EXTCON=y

#
# Extcon Device Drivers
#
# CONFIG_EXTCON_GPIO is not set
CONFIG_EXTCON_MAX14577=y
CONFIG_EXTCON_MAX3355=y
CONFIG_EXTCON_MAX77693=y
CONFIG_EXTCON_MAX77843=y
# CONFIG_EXTCON_MAX8997 is not set
# CONFIG_EXTCON_QCOM_SPMI_MISC is not set
CONFIG_EXTCON_RT8973A=y
CONFIG_EXTCON_SM5502=y
CONFIG_EXTCON_USB_GPIO=y
CONFIG_MEMORY=y
CONFIG_JZ4780_NEMC=y
# CONFIG_SAMSUNG_MC is not set
# CONFIG_IIO is not set
CONFIG_PWM=y
CONFIG_PWM_SYSFS=y
# CONFIG_PWM_BCM_IPROC is not set
# CONFIG_PWM_CLPS711X is not set
# CONFIG_PWM_FSL_FTM is not set
# CONFIG_PWM_HIBVT is not set
# CONFIG_PWM_IMG is not set
CONFIG_PWM_LP3943=y
# CONFIG_PWM_MTK_DISP is not set
# CONFIG_PWM_MEDIATEK is not set
# CONFIG_PWM_PCA9685 is not set
# CONFIG_PWM_RCAR is not set
# CONFIG_PWM_RENESAS_TPU is not set
# CONFIG_PWM_STM32_LP is not set
# CONFIG_PWM_SUN4I is not set

#
# IRQ chip support
#
CONFIG_IRQCHIP=y
CONFIG_ARM_GIC_MAX_NR=1
# CONFIG_JCORE_AIC is not set
# CONFIG_TS4800_IRQ is not set
# CONFIG_EZNPS_GIC is not set
# CONFIG_IRQ_UNIPHIER_AIDET is not set
CONFIG_IPACK_BUS=y
CONFIG_RESET_CONTROLLER=y
# CONFIG_RESET_ATH79 is not set
# CONFIG_RESET_AXS10X is not set
# CONFIG_RESET_BERLIN is not set
# CONFIG_RESET_HSDK is not set
# CONFIG_RESET_IMX7 is not set
# CONFIG_RESET_LANTIQ is not set
# CONFIG_RESET_LPC18XX is not set
# CONFIG_RESET_MESON is not set
# CONFIG_RESET_MESON_AUDIO_ARB is not set
# CONFIG_RESET_PISTACHIO is not set
# CONFIG_RESET_QCOM_AOSS is not set
CONFIG_RESET_SIMPLE=y
# CONFIG_RESET_STM32MP157 is not set
# CONFIG_RESET_SUNXI is not set
# CONFIG_RESET_TI_SYSCON is not set
# CONFIG_RESET_UNIPHIER is not set
# CONFIG_RESET_UNIPHIER_USB3 is not set
# CONFIG_RESET_ZYNQ is not set
# CONFIG_COMMON_RESET_HI3660 is not set
# CONFIG_COMMON_RESET_HI6220 is not set
# CONFIG_FMC is not set

#
# PHY Subsystem
#
CONFIG_GENERIC_PHY=y
# CONFIG_PHY_LPC18XX_USB_OTG is not set
# CONFIG_PHY_XGENE is not set
# CONFIG_PHY_MESON8B_USB2 is not set
# CONFIG_PHY_MESON_GXL_USB2 is not set
# CONFIG_PHY_MESON_GXL_USB3 is not set
# CONFIG_PHY_CYGNUS_PCIE is not set
# CONFIG_BCM_KONA_USB2_PHY is not set
# CONFIG_PHY_BCM_NS_USB2 is not set
# CONFIG_PHY_NS2_USB_DRD is not set
# CONFIG_PHY_BRCM_SATA is not set
# CONFIG_PHY_BCM_SR_PCIE is not set
# CONFIG_PHY_HI6220_USB is not set
# CONFIG_PHY_HISTB_COMBPHY is not set
# CONFIG_PHY_HISI_INNO_USB2 is not set
# CONFIG_PHY_LANTIQ_RCU_USB2 is not set
CONFIG_ARMADA375_USBCLUSTER_PHY=y
# CONFIG_PHY_MVEBU_CP110_COMPHY is not set
# CONFIG_PHY_PXA_28NM_HSIC is not set
# CONFIG_PHY_PXA_28NM_USB2 is not set
CONFIG_PHY_MAPPHONE_MDM6600=y
CONFIG_PHY_ATH79_USB=y
# CONFIG_PHY_QCOM_QMP is not set
# CONFIG_PHY_QCOM_QUSB2 is not set
CONFIG_PHY_QCOM_USB_HS=y
CONFIG_PHY_QCOM_USB_HSIC=y
# CONFIG_PHY_RALINK_USB is not set
# CONFIG_PHY_RCAR_GEN3_USB3 is not set
# CONFIG_PHY_ROCKCHIP_INNO_USB2 is not set
# CONFIG_PHY_ROCKCHIP_PCIE is not set
# CONFIG_PHY_ROCKCHIP_TYPEC is not set
# CONFIG_PHY_EXYNOS_DP_VIDEO is not set
# CONFIG_PHY_EXYNOS_MIPI_VIDEO is not set
# CONFIG_PHY_EXYNOS_PCIE is not set
CONFIG_PHY_SAMSUNG_USB2=y
# CONFIG_PHY_ST_SPEAR1310_MIPHY is not set
# CONFIG_PHY_ST_SPEAR1340_MIPHY is not set
# CONFIG_PHY_STIH407_USB is not set
# CONFIG_PHY_STM32_USBPHYC is not set
# CONFIG_OMAP_CONTROL_PHY is not set
CONFIG_PHY_TUSB1210=y
CONFIG_POWERCAP=y
# CONFIG_MCB is not set

#
# Performance monitor support
#
# CONFIG_RAS is not set

#
# Android
#
# CONFIG_ANDROID is not set
CONFIG_DAX=y
CONFIG_NVMEM=y
# CONFIG_NVMEM_IMX_IIM is not set
# CONFIG_NVMEM_IMX_OCOTP is not set
# CONFIG_NVMEM_LPC18XX_EEPROM is not set
# CONFIG_NVMEM_LPC18XX_OTP is not set
# CONFIG_NVMEM_MXS_OCOTP is not set
# CONFIG_MTK_EFUSE is not set
# CONFIG_QCOM_QFPROM is not set
# CONFIG_ROCKCHIP_EFUSE is not set
# CONFIG_NVMEM_BCM_OCOTP is not set
# CONFIG_UNIPHIER_EFUSE is not set
# CONFIG_NVMEM_VF610_OCOTP is not set
# CONFIG_MESON_MX_EFUSE is not set
# CONFIG_NVMEM_SNVS_LPGPR is not set
# CONFIG_SC27XX_EFUSE is not set

#
# HW tracing support
#
# CONFIG_STM is not set
# CONFIG_INTEL_TH is not set
CONFIG_FPGA=y
# CONFIG_FPGA_MGR_SOCFPGA is not set
# CONFIG_FPGA_MGR_SOCFPGA_A10 is not set
CONFIG_ALTERA_PR_IP_CORE=y
CONFIG_ALTERA_PR_IP_CORE_PLAT=y
# CONFIG_FPGA_MGR_ZYNQ_FPGA is not set
CONFIG_FPGA_BRIDGE=y
CONFIG_XILINX_PR_DECOUPLER=y
CONFIG_FPGA_REGION=y
CONFIG_OF_FPGA_REGION=y
CONFIG_FPGA_DFL=y
# CONFIG_FPGA_DFL_FME is not set
# CONFIG_FPGA_DFL_AFU is not set
CONFIG_FSI=y
CONFIG_FSI_NEW_DEV_NODE=y
# CONFIG_FSI_MASTER_GPIO is not set
# CONFIG_FSI_MASTER_HUB is not set
CONFIG_FSI_SCOM=y
CONFIG_FSI_SBEFIFO=y
# CONFIG_TEE is not set
CONFIG_MULTIPLEXER=y

#
# Multiplexer drivers
#
CONFIG_MUX_ADG792A=y
CONFIG_MUX_GPIO=y
CONFIG_MUX_MMIO=y
CONFIG_PM_OPP=y
# CONFIG_SIOX is not set
CONFIG_SLIMBUS=y
# CONFIG_SLIM_QCOM_CTRL is not set
# CONFIG_LEGACY_ENERGY_MODEL_DT is not set

#
# File systems
#
CONFIG_FS_IOMAP=y
# CONFIG_EXT2_FS is not set
CONFIG_EXT3_FS=y
CONFIG_EXT3_FS_POSIX_ACL=y
CONFIG_EXT3_FS_SECURITY=y
CONFIG_EXT4_FS=y
CONFIG_EXT4_USE_FOR_EXT2=y
CONFIG_EXT4_FS_POSIX_ACL=y
CONFIG_EXT4_FS_SECURITY=y
# CONFIG_EXT4_ENCRYPTION is not set
# CONFIG_EXT4_DEBUG is not set
CONFIG_JBD2=y
# CONFIG_JBD2_DEBUG is not set
CONFIG_FS_MBCACHE=y
# CONFIG_REISERFS_FS is not set
# CONFIG_JFS_FS is not set
# CONFIG_XFS_FS is not set
CONFIG_GFS2_FS=y
CONFIG_GFS2_FS_LOCKING_DLM=y
# CONFIG_OCFS2_FS is not set
# CONFIG_BTRFS_FS is not set
CONFIG_NILFS2_FS=y
CONFIG_F2FS_FS=y
CONFIG_F2FS_STAT_FS=y
CONFIG_F2FS_FS_XATTR=y
CONFIG_F2FS_FS_POSIX_ACL=y
# CONFIG_F2FS_FS_SECURITY is not set
CONFIG_F2FS_CHECK_FS=y
# CONFIG_F2FS_FS_ENCRYPTION is not set
# CONFIG_F2FS_FAULT_INJECTION is not set
CONFIG_F2FS_FS_COMPRESSION=y
CONFIG_F2FS_FS_LZO=y
# CONFIG_F2FS_FS_LZ4 is not set
CONFIG_F2FS_FS_ZSTD=y
# CONFIG_FS_DAX is not set
CONFIG_FS_POSIX_ACL=y
CONFIG_EXPORTFS=y
# CONFIG_EXPORTFS_BLOCK_OPS is not set
CONFIG_FILE_LOCKING=y
CONFIG_MANDATORY_FILE_LOCKING=y
# CONFIG_FS_ENCRYPTION is not set
CONFIG_FS_VERITY=y
# CONFIG_FS_VERITY_DEBUG is not set
CONFIG_FS_VERITY_BUILTIN_SIGNATURES=y
CONFIG_FSNOTIFY=y
CONFIG_DNOTIFY=y
CONFIG_INOTIFY_USER=y
# CONFIG_FANOTIFY is not set
CONFIG_QUOTA=y
# CONFIG_QUOTA_NETLINK_INTERFACE is not set
CONFIG_PRINT_QUOTA_WARNING=y
CONFIG_QUOTA_DEBUG=y
CONFIG_QUOTA_TREE=y
CONFIG_QFMT_V1=y
CONFIG_QFMT_V2=y
CONFIG_QUOTACTL=y
CONFIG_AUTOFS4_FS=y
CONFIG_AUTOFS_FS=y
CONFIG_FUSE_FS=y
CONFIG_CUSE=y
CONFIG_OVERLAY_FS=y
# CONFIG_OVERLAY_FS_REDIRECT_DIR is not set
CONFIG_OVERLAY_FS_REDIRECT_ALWAYS_FOLLOW=y
# CONFIG_OVERLAY_FS_INDEX is not set
# CONFIG_OVERLAY_FS_XINO_AUTO is not set
# CONFIG_OVERLAY_FS_METACOPY is not set
# CONFIG_INCREMENTAL_FS is not set

#
# Caches
#
CONFIG_FSCACHE=y
CONFIG_FSCACHE_DEBUG=y
CONFIG_CACHEFILES=y
CONFIG_CACHEFILES_DEBUG=y

#
# CD-ROM/DVD Filesystems
#
# CONFIG_ISO9660_FS is not set
CONFIG_UDF_FS=y

#
# DOS/FAT/NT Filesystems
#
CONFIG_FAT_FS=y
CONFIG_MSDOS_FS=y
# CONFIG_VFAT_FS is not set
CONFIG_FAT_DEFAULT_CODEPAGE=437
CONFIG_NTFS_FS=y
CONFIG_NTFS_DEBUG=y
CONFIG_NTFS_RW=y

#
# Pseudo filesystems
#
# CONFIG_PROC_FS is not set
# CONFIG_PROC_CHILDREN is not set
CONFIG_KERNFS=y
CONFIG_SYSFS=y
CONFIG_TMPFS=y
CONFIG_TMPFS_POSIX_ACL=y
CONFIG_TMPFS_XATTR=y
CONFIG_MEMFD_CREATE=y
CONFIG_CONFIGFS_FS=y
CONFIG_MISC_FILESYSTEMS=y
# CONFIG_ORANGEFS_FS is not set
# CONFIG_ADFS_FS is not set
CONFIG_AFFS_FS=y
CONFIG_ECRYPT_FS=y
# CONFIG_ECRYPT_FS_MESSAGING is not set
# CONFIG_SDCARD_FS is not set
# CONFIG_HFS_FS is not set
CONFIG_HFSPLUS_FS=y
CONFIG_BEFS_FS=y
# CONFIG_BEFS_DEBUG is not set
CONFIG_BFS_FS=y
CONFIG_EFS_FS=y
CONFIG_CRAMFS=y
# CONFIG_CRAMFS_BLOCKDEV is not set
CONFIG_SQUASHFS=y
CONFIG_SQUASHFS_FILE_CACHE=y
# CONFIG_SQUASHFS_FILE_DIRECT is not set
CONFIG_SQUASHFS_DECOMP_SINGLE=y
# CONFIG_SQUASHFS_DECOMP_MULTI is not set
# CONFIG_SQUASHFS_DECOMP_MULTI_PERCPU is not set
# CONFIG_SQUASHFS_XATTR is not set
CONFIG_SQUASHFS_ZLIB=y
CONFIG_SQUASHFS_LZ4=y
# CONFIG_SQUASHFS_LZO is not set
# CONFIG_SQUASHFS_XZ is not set
CONFIG_SQUASHFS_ZSTD=y
CONFIG_SQUASHFS_4K_DEVBLK_SIZE=y
CONFIG_SQUASHFS_EMBEDDED=y
CONFIG_SQUASHFS_FRAGMENT_CACHE_SIZE=3
# CONFIG_VXFS_FS is not set
# CONFIG_MINIX_FS is not set
CONFIG_OMFS_FS=y
CONFIG_HPFS_FS=y
# CONFIG_QNX4FS_FS is not set
CONFIG_QNX6FS_FS=y
# CONFIG_QNX6FS_DEBUG is not set
# CONFIG_ROMFS_FS is not set
CONFIG_PSTORE=y
CONFIG_PSTORE_DEFLATE_COMPRESS=y
# CONFIG_PSTORE_LZO_COMPRESS is not set
CONFIG_PSTORE_LZ4_COMPRESS=y
# CONFIG_PSTORE_LZ4HC_COMPRESS is not set
# CONFIG_PSTORE_842_COMPRESS is not set
CONFIG_PSTORE_ZSTD_COMPRESS=y
CONFIG_PSTORE_COMPRESS=y
CONFIG_PSTORE_DEFLATE_COMPRESS_DEFAULT=y
# CONFIG_PSTORE_LZ4_COMPRESS_DEFAULT is not set
# CONFIG_PSTORE_ZSTD_COMPRESS_DEFAULT is not set
CONFIG_PSTORE_COMPRESS_DEFAULT="deflate"
CONFIG_PSTORE_CONSOLE=y
# CONFIG_PSTORE_PMSG is not set
# CONFIG_PSTORE_RAM is not set
CONFIG_SYSV_FS=y
# CONFIG_UFS_FS is not set
# CONFIG_NETWORK_FILESYSTEMS is not set
CONFIG_NLS=y
CONFIG_NLS_DEFAULT="iso8859-1"
CONFIG_NLS_CODEPAGE_437=y
CONFIG_NLS_CODEPAGE_737=y
CONFIG_NLS_CODEPAGE_775=y
# CONFIG_NLS_CODEPAGE_850 is not set
CONFIG_NLS_CODEPAGE_852=y
# CONFIG_NLS_CODEPAGE_855 is not set
# CONFIG_NLS_CODEPAGE_857 is not set
# CONFIG_NLS_CODEPAGE_860 is not set
# CONFIG_NLS_CODEPAGE_861 is not set
CONFIG_NLS_CODEPAGE_862=y
CONFIG_NLS_CODEPAGE_863=y
# CONFIG_NLS_CODEPAGE_864 is not set
CONFIG_NLS_CODEPAGE_865=y
CONFIG_NLS_CODEPAGE_866=y
CONFIG_NLS_CODEPAGE_869=y
# CONFIG_NLS_CODEPAGE_936 is not set
CONFIG_NLS_CODEPAGE_950=y
CONFIG_NLS_CODEPAGE_932=y
# CONFIG_NLS_CODEPAGE_949 is not set
CONFIG_NLS_CODEPAGE_874=y
CONFIG_NLS_ISO8859_8=y
# CONFIG_NLS_CODEPAGE_1250 is not set
CONFIG_NLS_CODEPAGE_1251=y
# CONFIG_NLS_ASCII is not set
# CONFIG_NLS_ISO8859_1 is not set
# CONFIG_NLS_ISO8859_2 is not set
CONFIG_NLS_ISO8859_3=y
# CONFIG_NLS_ISO8859_4 is not set
# CONFIG_NLS_ISO8859_5 is not set
# CONFIG_NLS_ISO8859_6 is not set
# CONFIG_NLS_ISO8859_7 is not set
CONFIG_NLS_ISO8859_9=y
# CONFIG_NLS_ISO8859_13 is not set
CONFIG_NLS_ISO8859_14=y
CONFIG_NLS_ISO8859_15=y
CONFIG_NLS_KOI8_R=y
CONFIG_NLS_KOI8_U=y
CONFIG_NLS_MAC_ROMAN=y
# CONFIG_NLS_MAC_CELTIC is not set
CONFIG_NLS_MAC_CENTEURO=y
CONFIG_NLS_MAC_CROATIAN=y
CONFIG_NLS_MAC_CYRILLIC=y
# CONFIG_NLS_MAC_GAELIC is not set
CONFIG_NLS_MAC_GREEK=y
CONFIG_NLS_MAC_ICELAND=y
CONFIG_NLS_MAC_INUIT=y
CONFIG_NLS_MAC_ROMANIAN=y
CONFIG_NLS_MAC_TURKISH=y
CONFIG_NLS_UTF8=y
CONFIG_DLM=y
CONFIG_DLM_DEBUG=y
CONFIG_UNICODE=y
CONFIG_UNICODE_NORMALIZATION_SELFTEST=y

#
# Security options
#
CONFIG_KEYS=y
# CONFIG_PERSISTENT_KEYRINGS is not set
CONFIG_BIG_KEYS=y
CONFIG_TRUSTED_KEYS=y
CONFIG_ENCRYPTED_KEYS=y
CONFIG_KEY_DH_OPERATIONS=y
# CONFIG_SECURITY_DMESG_RESTRICT is not set
CONFIG_SECURITYFS=y
CONFIG_HAVE_HARDENED_USERCOPY_ALLOCATOR=y
CONFIG_HARDENED_USERCOPY=y
CONFIG_HARDENED_USERCOPY_FALLBACK=y
# CONFIG_HARDENED_USERCOPY_PAGESPAN is not set
# CONFIG_STATIC_USERMODEHELPER is not set
CONFIG_DEFAULT_SECURITY_DAC=y
CONFIG_DEFAULT_SECURITY=""

#
# Kernel hardening options
#

#
# Memory initialization
#
CONFIG_CC_HAS_AUTO_VAR_INIT=y
# CONFIG_INIT_STACK_NONE is not set
CONFIG_INIT_STACK_ALL=y
CONFIG_INIT_ON_ALLOC_DEFAULT_ON=y
# CONFIG_INIT_ON_FREE_DEFAULT_ON is not set
CONFIG_CRYPTO=y

#
# Crypto core or helper
#
CONFIG_CRYPTO_ALGAPI=y
CONFIG_CRYPTO_ALGAPI2=y
CONFIG_CRYPTO_AEAD=y
CONFIG_CRYPTO_AEAD2=y
CONFIG_CRYPTO_BLKCIPHER=y
CONFIG_CRYPTO_BLKCIPHER2=y
CONFIG_CRYPTO_HASH=y
CONFIG_CRYPTO_HASH2=y
CONFIG_CRYPTO_RNG=y
CONFIG_CRYPTO_RNG2=y
CONFIG_CRYPTO_RNG_DEFAULT=y
CONFIG_CRYPTO_AKCIPHER2=y
CONFIG_CRYPTO_AKCIPHER=y
CONFIG_CRYPTO_KPP2=y
CONFIG_CRYPTO_KPP=y
CONFIG_CRYPTO_ACOMP2=y
CONFIG_CRYPTO_RSA=y
CONFIG_CRYPTO_DH=y
CONFIG_CRYPTO_ECDH=y
CONFIG_CRYPTO_MANAGER=y
CONFIG_CRYPTO_MANAGER2=y
CONFIG_CRYPTO_USER=y
CONFIG_CRYPTO_MANAGER_DISABLE_TESTS=y
CONFIG_CRYPTO_GF128MUL=y
CONFIG_CRYPTO_NULL=y
CONFIG_CRYPTO_NULL2=y
CONFIG_CRYPTO_WORKQUEUE=y
# CONFIG_CRYPTO_CRYPTD is not set
# CONFIG_CRYPTO_MCRYPTD is not set
CONFIG_CRYPTO_AUTHENC=y
CONFIG_CRYPTO_ENGINE=y

#
# Authenticated Encryption with Associated Data
#
CONFIG_CRYPTO_CCM=y
CONFIG_CRYPTO_GCM=y
CONFIG_CRYPTO_CHACHA20POLY1305=y
CONFIG_CRYPTO_AEGIS128=y
# CONFIG_CRYPTO_AEGIS128L is not set
# CONFIG_CRYPTO_AEGIS256 is not set
# CONFIG_CRYPTO_MORUS640 is not set
# CONFIG_CRYPTO_MORUS1280 is not set
CONFIG_CRYPTO_SEQIV=y
CONFIG_CRYPTO_ECHAINIV=y

#
# Block modes
#
CONFIG_CRYPTO_CBC=y
CONFIG_CRYPTO_CFB=y
CONFIG_CRYPTO_CTR=y
# CONFIG_CRYPTO_CTS is not set
CONFIG_CRYPTO_ECB=y
# CONFIG_CRYPTO_LRW is not set
CONFIG_CRYPTO_PCBC=y
CONFIG_CRYPTO_XTS=y
CONFIG_CRYPTO_KEYWRAP=y
CONFIG_CRYPTO_NHPOLY1305=y
CONFIG_CRYPTO_ADIANTUM=y

#
# Hash modes
#
CONFIG_CRYPTO_CMAC=y
CONFIG_CRYPTO_HMAC=y
CONFIG_CRYPTO_XCBC=y
CONFIG_CRYPTO_VMAC=y

#
# Digest
#
CONFIG_CRYPTO_CRC32C=y
CONFIG_CRYPTO_CRC32=y
CONFIG_CRYPTO_CRCT10DIF=y
CONFIG_CRYPTO_GHASH=y
CONFIG_CRYPTO_POLY1305=y
CONFIG_CRYPTO_MD4=y
CONFIG_CRYPTO_MD5=y
CONFIG_CRYPTO_MICHAEL_MIC=y
# CONFIG_CRYPTO_RMD128 is not set
CONFIG_CRYPTO_RMD160=y
# CONFIG_CRYPTO_RMD256 is not set
# CONFIG_CRYPTO_RMD320 is not set
CONFIG_CRYPTO_SHA1=y
CONFIG_CRYPTO_SHA256=y
CONFIG_CRYPTO_SHA512=y
CONFIG_CRYPTO_SHA3=y
CONFIG_CRYPTO_SM3=y
# CONFIG_CRYPTO_TGR192 is not set
# CONFIG_CRYPTO_WP512 is not set

#
# Ciphers
#
CONFIG_CRYPTO_AES=y
# CONFIG_CRYPTO_AES_TI is not set
CONFIG_CRYPTO_ANUBIS=y
CONFIG_CRYPTO_ARC4=y
CONFIG_CRYPTO_BLOWFISH=y
CONFIG_CRYPTO_BLOWFISH_COMMON=y
# CONFIG_CRYPTO_CAMELLIA is not set
CONFIG_CRYPTO_CAST_COMMON=y
CONFIG_CRYPTO_CAST5=y
# CONFIG_CRYPTO_CAST6 is not set
CONFIG_CRYPTO_DES=y
# CONFIG_CRYPTO_FCRYPT is not set
CONFIG_CRYPTO_KHAZAD=y
# CONFIG_CRYPTO_SALSA20 is not set
CONFIG_CRYPTO_CHACHA20=y
CONFIG_CRYPTO_SEED=y
CONFIG_CRYPTO_SERPENT=y
CONFIG_CRYPTO_SM4=y
CONFIG_CRYPTO_TEA=y
CONFIG_CRYPTO_TWOFISH=y
CONFIG_CRYPTO_TWOFISH_COMMON=y

#
# Compression
#
CONFIG_CRYPTO_DEFLATE=y
# CONFIG_CRYPTO_LZO is not set
# CONFIG_CRYPTO_842 is not set
CONFIG_CRYPTO_LZ4=y
CONFIG_CRYPTO_LZ4HC=y
CONFIG_CRYPTO_ZSTD=y

#
# Random Number Generation
#
# CONFIG_CRYPTO_ANSI_CPRNG is not set
CONFIG_CRYPTO_DRBG_MENU=y
CONFIG_CRYPTO_DRBG_HMAC=y
CONFIG_CRYPTO_DRBG_HASH=y
CONFIG_CRYPTO_DRBG_CTR=y
CONFIG_CRYPTO_DRBG=y
CONFIG_CRYPTO_JITTERENTROPY=y
CONFIG_CRYPTO_USER_API=y
# CONFIG_CRYPTO_USER_API_HASH is not set
CONFIG_CRYPTO_USER_API_SKCIPHER=y
# CONFIG_CRYPTO_USER_API_RNG is not set
# CONFIG_CRYPTO_USER_API_AEAD is not set
CONFIG_CRYPTO_HASH_INFO=y
CONFIG_CRYPTO_HW=y
# CONFIG_CRYPTO_DEV_PICOXCELL is not set
# CONFIG_CRYPTO_DEV_EXYNOS_RNG is not set
# CONFIG_CRYPTO_DEV_S5P is not set
# CONFIG_CRYPTO_DEV_ATMEL_AUTHENC is not set
# CONFIG_CRYPTO_DEV_ATMEL_AES is not set
# CONFIG_CRYPTO_DEV_ATMEL_TDES is not set
# CONFIG_CRYPTO_DEV_ATMEL_SHA is not set
CONFIG_CRYPTO_DEV_ATMEL_ECC=y
# CONFIG_CRYPTO_DEV_QCE is not set
# CONFIG_CRYPTO_DEV_QCOM_RNG is not set
# CONFIG_CRYPTO_DEV_IMGTEC_HASH is not set
# CONFIG_CRYPTO_DEV_MEDIATEK is not set
CONFIG_CRYPTO_DEV_VIRTIO=y
CONFIG_CRYPTO_DEV_CCREE=y
# CONFIG_CRYPTO_DEV_HISI_SEC is not set
CONFIG_ASYMMETRIC_KEY_TYPE=y
CONFIG_ASYMMETRIC_PUBLIC_KEY_SUBTYPE=y
CONFIG_X509_CERTIFICATE_PARSER=y
CONFIG_PKCS7_MESSAGE_PARSER=y
# CONFIG_PKCS7_TEST_KEY is not set
CONFIG_SIGNED_PE_FILE_VERIFICATION=y

#
# Certificates for signature checking
#
CONFIG_SYSTEM_TRUSTED_KEYRING=y
CONFIG_SYSTEM_TRUSTED_KEYS=""
# CONFIG_SYSTEM_EXTRA_CERTIFICATE is not set
# CONFIG_SECONDARY_TRUSTED_KEYRING is not set
# CONFIG_SYSTEM_BLACKLIST_KEYRING is not set
CONFIG_BINARY_PRINTF=y

#
# Library routines
#
CONFIG_BITREVERSE=y
CONFIG_RATIONAL=y
CONFIG_GENERIC_NET_UTILS=y
CONFIG_GENERIC_PCI_IOMAP=y
CONFIG_CRC_CCITT=y
CONFIG_CRC16=y
CONFIG_CRC_T10DIF=y
CONFIG_CRC_ITU_T=y
CONFIG_CRC32=y
# CONFIG_CRC32_SELFTEST is not set
# CONFIG_CRC32_SLICEBY8 is not set
# CONFIG_CRC32_SLICEBY4 is not set
CONFIG_CRC32_SARWATE=y
# CONFIG_CRC32_BIT is not set
CONFIG_CRC64=y
CONFIG_CRC4=y
CONFIG_CRC7=y
CONFIG_LIBCRC32C=y
CONFIG_CRC8=y
CONFIG_XXHASH=y
CONFIG_AUDIT_GENERIC=y
# CONFIG_RANDOM32_SELFTEST is not set
CONFIG_ZLIB_INFLATE=y
CONFIG_ZLIB_DEFLATE=y
CONFIG_LZO_COMPRESS=y
CONFIG_LZO_DECOMPRESS=y
CONFIG_LZ4_COMPRESS=y
CONFIG_LZ4HC_COMPRESS=y
CONFIG_LZ4_DECOMPRESS=y
CONFIG_ZSTD_COMPRESS=y
CONFIG_ZSTD_DECOMPRESS=y
CONFIG_XZ_DEC=y
CONFIG_XZ_DEC_X86=y
# CONFIG_XZ_DEC_POWERPC is not set
# CONFIG_XZ_DEC_IA64 is not set
# CONFIG_XZ_DEC_ARM is not set
CONFIG_XZ_DEC_ARMTHUMB=y
CONFIG_XZ_DEC_SPARC=y
CONFIG_XZ_DEC_BCJ=y
CONFIG_XZ_DEC_TEST=y
CONFIG_DECOMPRESS_LZMA=y
CONFIG_GENERIC_ALLOCATOR=y
CONFIG_TEXTSEARCH=y
CONFIG_TEXTSEARCH_KMP=y
CONFIG_TEXTSEARCH_BM=y
CONFIG_TEXTSEARCH_FSM=y
CONFIG_ASSOCIATIVE_ARRAY=y
CONFIG_HAS_IOMEM=y
CONFIG_HAS_IOPORT_MAP=y
CONFIG_HAS_DMA=y
CONFIG_NEED_DMA_MAP_STATE=y
CONFIG_ARCH_HAS_SYNC_DMA_FOR_DEVICE=y
CONFIG_ARCH_HAS_SYNC_DMA_FOR_CPU=y
CONFIG_DMA_DIRECT_OPS=y
CONFIG_DMA_NONCOHERENT_OPS=y
CONFIG_SGL_ALLOC=y
CONFIG_DQL=y
CONFIG_GLOB=y
CONFIG_GLOB_SELFTEST=y
CONFIG_NLATTR=y
CONFIG_GENERIC_ATOMIC64=y
CONFIG_CLZ_TAB=y
CONFIG_CORDIC=y
# CONFIG_DDR is not set
# CONFIG_IRQ_POLL is not set
CONFIG_MPILIB=y
CONFIG_LIBFDT=y
CONFIG_OID_REGISTRY=y
CONFIG_SG_POOL=y
CONFIG_ARCH_HAS_SG_CHAIN=y
CONFIG_STACKDEPOT=y
CONFIG_SBITMAP=y
# CONFIG_PARMAN is not set
# CONFIG_STRING_SELFTEST is not set

#
# Kernel hacking
#

#
# printk and dmesg options
#
CONFIG_CONSOLE_LOGLEVEL_DEFAULT=7
CONFIG_CONSOLE_LOGLEVEL_QUIET=4
CONFIG_MESSAGE_LOGLEVEL_DEFAULT=4

#
# Compile-time checks and compiler options
#
CONFIG_ENABLE_MUST_CHECK=y
CONFIG_FRAME_WARN=1024
# CONFIG_STRIP_ASM_SYMS is not set
CONFIG_READABLE_ASM=y
# CONFIG_UNUSED_SYMBOLS is not set
CONFIG_PAGE_OWNER=y
CONFIG_DEBUG_FS=y
CONFIG_HEADERS_CHECK=y
CONFIG_DEBUG_SECTION_MISMATCH=y
CONFIG_SECTION_MISMATCH_WARN_ONLY=y
CONFIG_ARCH_WANT_FRAME_POINTERS=y
CONFIG_FRAME_POINTER=y
CONFIG_DEBUG_FORCE_WEAK_PER_CPU=y
CONFIG_MAGIC_SYSRQ=y
CONFIG_MAGIC_SYSRQ_DEFAULT_ENABLE=0x1
CONFIG_MAGIC_SYSRQ_SERIAL=y
CONFIG_DEBUG_KERNEL=y

#
# Memory Debugging
#
CONFIG_PAGE_EXTENSION=y
CONFIG_DEBUG_PAGEALLOC=y
# CONFIG_DEBUG_PAGEALLOC_ENABLE_DEFAULT is not set
CONFIG_PAGE_POISONING=y
# CONFIG_PAGE_POISONING_NO_SANITY is not set
# CONFIG_PAGE_POISONING_ZERO is not set
# CONFIG_DEBUG_PAGE_REF is not set
CONFIG_DEBUG_OBJECTS=y
# CONFIG_DEBUG_OBJECTS_SELFTEST is not set
# CONFIG_DEBUG_OBJECTS_FREE is not set
CONFIG_DEBUG_OBJECTS_TIMERS=y
# CONFIG_DEBUG_OBJECTS_WORK is not set
# CONFIG_DEBUG_OBJECTS_RCU_HEAD is not set
# CONFIG_DEBUG_OBJECTS_PERCPU_COUNTER is not set
CONFIG_DEBUG_OBJECTS_ENABLE_DEFAULT=1
CONFIG_SLUB_DEBUG_ON=y
# CONFIG_SLUB_STATS is not set
CONFIG_HAVE_DEBUG_KMEMLEAK=y
# CONFIG_DEBUG_KMEMLEAK is not set
CONFIG_DEBUG_STACK_USAGE=y
# CONFIG_DEBUG_VM is not set
# CONFIG_DEBUG_MEMORY_INIT is not set
CONFIG_DEBUG_HIGHMEM=y
CONFIG_HAVE_ARCH_KASAN=y
CONFIG_CC_HAS_KASAN_GENERIC=y
# CONFIG_KASAN is not set
CONFIG_KASAN_STACK=1
CONFIG_CC_HAS_SANCOV_TRACE_PC=y
# CONFIG_DEBUG_SHIRQ is not set

#
# Debug Lockups and Hangs
#
# CONFIG_SOFTLOCKUP_DETECTOR is not set
CONFIG_DETECT_HUNG_TASK=y
CONFIG_DEFAULT_HUNG_TASK_TIMEOUT=120
# CONFIG_BOOTPARAM_HUNG_TASK_PANIC is not set
CONFIG_BOOTPARAM_HUNG_TASK_PANIC_VALUE=0
CONFIG_WQ_WATCHDOG=y
# CONFIG_PANIC_ON_OOPS is not set
CONFIG_PANIC_ON_OOPS_VALUE=0
CONFIG_PANIC_TIMEOUT=0
CONFIG_SCHED_STACK_END_CHECK=y
CONFIG_DEBUG_TIMEKEEPING=y
# CONFIG_DEBUG_PREEMPT is not set

#
# Lock Debugging (spinlocks, mutexes, etc...)
#
CONFIG_LOCK_DEBUGGING_SUPPORT=y
CONFIG_PROVE_LOCKING=y
CONFIG_LOCK_STAT=y
CONFIG_DEBUG_RT_MUTEXES=y
CONFIG_DEBUG_SPINLOCK=y
CONFIG_DEBUG_MUTEXES=y
CONFIG_DEBUG_WW_MUTEX_SLOWPATH=y
CONFIG_DEBUG_LOCK_ALLOC=y
CONFIG_LOCKDEP=y
CONFIG_DEBUG_LOCKDEP=y
# CONFIG_DEBUG_ATOMIC_SLEEP is not set
# CONFIG_DEBUG_LOCKING_API_SELFTESTS is not set
# CONFIG_LOCK_TORTURE_TEST is not set
CONFIG_WW_MUTEX_SELFTEST=y
CONFIG_TRACE_IRQFLAGS=y
CONFIG_STACKTRACE=y
# CONFIG_WARN_ALL_UNSEEDED_RANDOM is not set
CONFIG_DEBUG_KOBJECT=y
CONFIG_DEBUG_KOBJECT_RELEASE=y
CONFIG_DEBUG_LIST=y
# CONFIG_DEBUG_PI_LIST is not set
# CONFIG_DEBUG_SG is not set
CONFIG_DEBUG_NOTIFIERS=y
CONFIG_DEBUG_CREDENTIALS=y

#
# RCU Debugging
#
CONFIG_PROVE_RCU=y
# CONFIG_RCU_PERF_TEST is not set
# CONFIG_RCU_TORTURE_TEST is not set
CONFIG_RCU_CPU_STALL_TIMEOUT=21
# CONFIG_RCU_TRACE is not set
CONFIG_RCU_EQS_DEBUG=y
# CONFIG_DEBUG_WQ_FORCE_RR_CPU is not set
# CONFIG_DEBUG_BLOCK_EXT_DEVT is not set
# CONFIG_NOTIFIER_ERROR_INJECTION is not set
CONFIG_FAULT_INJECTION=y
CONFIG_FAILSLAB=y
CONFIG_FAIL_PAGE_ALLOC=y
CONFIG_FAIL_MAKE_REQUEST=y
CONFIG_FAIL_IO_TIMEOUT=y
# CONFIG_FAULT_INJECTION_DEBUG_FS is not set
CONFIG_NOP_TRACER=y
CONFIG_HAVE_FUNCTION_TRACER=y
CONFIG_TRACE_CLOCK=y
CONFIG_RING_BUFFER=y
CONFIG_EVENT_TRACING=y
CONFIG_CONTEXT_SWITCH_TRACER=y
CONFIG_PREEMPTIRQ_TRACEPOINTS=y
CONFIG_TRACING=y
CONFIG_TRACING_SUPPORT=y
# CONFIG_FTRACE is not set
CONFIG_DMA_API_DEBUG=y
# CONFIG_DMA_API_DEBUG_SG is not set
# CONFIG_RUNTIME_TESTING_MENU is not set
# CONFIG_MEMTEST is not set
CONFIG_BUG_ON_DATA_CORRUPTION=y
# CONFIG_SAMPLES is not set
CONFIG_UBSAN=y
CONFIG_UBSAN_ALIGNMENT=y
CONFIG_DEBUG_TLB_SANITY=y
CONFIG_LD_NO_RELAX=y
CONFIG_S32C1I_SELFTEST=y

--3okMbrqwq/wIWsrV--
