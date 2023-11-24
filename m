Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2F7D2FE19
	for <oe-kbuild-all@lists.linux.dev>; Fri, 24 Nov 2023 15:42:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i0Eg8CKL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700840549; x=1732376549;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=d1K5ptN5K9QpcRiN2JueXdfmL+/7oV7+775IhHq++xw=;
  b=i0Eg8CKLWFs3gGHT9uo2tB9+1SKnF0q2qHQthbTlCooIGjr8gViS5XeQ
   M5QOhycWr1OyC18vN5rOpkBBx2TuqymZeIRX+U1z8jT606ryl7t4pyqDS
   H98dcjLWIcUqzLSjMHv7CbOJ/oQ/gQPE5xA6ej1fERP7dB29ELs6BKSSX
   AecJ7INPsJWWGbyfi/WsyKeiusfvqOEb9omOTys0XscVa2o59+AWwF3RV
   AeDqdxsTpDf7WKnm6U4lIrNR9DbI+wvw/X4n8LI4TQXCC5gx4IIWnbsXT
   EyR7WaekFH3eBc5JyzQmhDvXnMbppP+5aBXR7lG0OUC6sVcZ+6TdIkGWH
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="395257441"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; 
   d="scan'208";a="395257441"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2023 07:42:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="767510984"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; 
   d="scan'208";a="767510984"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 24 Nov 2023 07:42:24 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r6YJy-0002ye-0t;
	Fri, 24 Nov 2023 15:42:22 +0000
Date: Fri, 24 Nov 2023 23:41:59 +0800
From: kernel test robot <lkp@intel.com>
To: Zhang Yi <yi.zhang@huaweicloud.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC 13/18] ext4: impliment writeback iomap path
Message-ID: <202311241945.TOPPNdHa-lkp@intel.com>
References: <20231123125121.4064694-14-yi.zhang@huaweicloud.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231123125121.4064694-14-yi.zhang@huaweicloud.com>

Hi Zhang,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on v6.6]
[cannot apply to tytso-ext4/dev linus/master v6.7-rc2 v6.7-rc1 next-20231124]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Zhang-Yi/ext4-make-ext4_es_lookup_extent-return-the-next-extent-if-not-found/20231124-005707
base:   v6.6
patch link:    https://lore.kernel.org/r/20231123125121.4064694-14-yi.zhang%40huaweicloud.com
patch subject: [PATCH RFC 13/18] ext4: impliment writeback iomap path
config: m68k-sun3x_defconfig (https://download.01.org/0day-ci/archive/20231124/202311241945.TOPPNdHa-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231124/202311241945.TOPPNdHa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311241945.TOPPNdHa-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from fs/ext4/ext4_jbd2.h:17,
                    from fs/ext4/inode.c:45:
   fs/ext4/inode.c: In function 'ext4_iomap_prepare_ioend':
>> fs/ext4/inode.c:3913:26: warning: format '%ld' expects argument of type 'long int', but argument 5 has type 'size_t' {aka 'unsigned int'} [-Wformat=]
    3913 |                          "%s: jbd2_start: %ld blocks, ino %lu; err %d\n",
         |                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    3914 |                          __func__, ioend->io_size >> inode->i_blkbits,
         |                                    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                                   |
         |                                                   size_t {aka unsigned int}
   fs/ext4/ext4.h:3162:31: note: in definition of macro 'ext4_msg'
    3162 |         __ext4_msg(sb, level, fmt, ##__VA_ARGS__)
         |                               ^~~
   fs/ext4/inode.c:3913:45: note: format string is defined here
    3913 |                          "%s: jbd2_start: %ld blocks, ino %lu; err %d\n",
         |                                           ~~^
         |                                             |
         |                                             long int
         |                                           %d
   fs/ext4/inode.c: At top level:
   fs/ext4/inode.c:4083:46: warning: 'ext4_iomap_aops' defined but not used [-Wunused-const-variable=]
    4083 | static const struct address_space_operations ext4_iomap_aops = {
         |                                              ^~~~~~~~~~~~~~~


vim +3913 fs/ext4/inode.c

  3889	
  3890	static int ext4_iomap_prepare_ioend(struct iomap_ioend *ioend, int status)
  3891	{
  3892		handle_t *handle = NULL;
  3893		struct inode *inode = ioend->io_inode;
  3894		int rsv_blocks;
  3895		int ret;
  3896	
  3897		if (ioend->io_type != IOMAP_UNWRITTEN)
  3898			return status;
  3899	
  3900		ioend->io_bio->bi_end_io = ext4_iomap_end_bio;
  3901	
  3902		/*
  3903		 * Reserve enough transaction credits for unwritten extent
  3904		 * convert processing in end IO.
  3905		 */
  3906		rsv_blocks = 1 + ext4_chunk_trans_blocks(inode,
  3907					ioend->io_size >> inode->i_blkbits);
  3908		handle = ext4_journal_start_with_reserve(inode,
  3909					EXT4_HT_WRITE_PAGE, 0, rsv_blocks);
  3910		if (IS_ERR(handle)) {
  3911			ret = PTR_ERR(handle);
  3912			ext4_msg(inode->i_sb, KERN_CRIT,
> 3913				 "%s: jbd2_start: %ld blocks, ino %lu; err %d\n",
  3914				 __func__, ioend->io_size >> inode->i_blkbits,
  3915				 inode->i_ino, ret);
  3916			return status ? status : ret;
  3917		}
  3918		if (ext4_handle_valid(handle)) {
  3919			ioend->io_private = handle->h_rsv_handle;
  3920			handle->h_rsv_handle = NULL;
  3921		}
  3922		ext4_journal_stop(handle);
  3923	
  3924		return status;
  3925	}
  3926	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
