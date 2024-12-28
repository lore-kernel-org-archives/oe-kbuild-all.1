Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17A113FD1
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Dec 2024 03:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735355305; cv=none; b=b1cilKu+RLLW2+vPVC5S/PggAtpm9xK7P6pFrepMrPrxrtGt9Mwlsgt8Gm0/Sr2kG3+YxHdiSY1PksD/w3nvj89dQT1t5DmP/sAsXLx+t+u6madv/Zb7PpZxtlAtxHdnaxlwFDsL6XbMAeim+EovCAzy7s5UGk0ojvASag0DSnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735355305; c=relaxed/simple;
	bh=d+zcgDMfAq1sFuC0U5UWWx3KFY8dHpUGfHpStDYYa1M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YNTSeKk4hB0hiHWFN9pEf86wlM1fkQnPj5q7KExKL2IRbdcIZ8LQZzyXIsx+4r3gL3X73xJ8iuy8dHpzVrNPuQb1LLAzSG0mBCyplKYOrHFxRv0hNh9tQnIE7hdjOfMFI5O55U4pPV/rQi7MmFSGrWGeHcA4LCxkUrY9ODmEy5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LjoEmwOG; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LjoEmwOG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735355304; x=1766891304;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=d+zcgDMfAq1sFuC0U5UWWx3KFY8dHpUGfHpStDYYa1M=;
  b=LjoEmwOGULavrhnHgKznhG1n4BJGGC3bxMerTRLnb21VMcPXlKGcj4dK
   vjc8xDmC5dls6FrrSmkdcj8PO+CmB6Zn45mnG4VaWRCoYOVx1urgIWFCM
   oIvMbEn49/MmXPmRd5RIpFmex36lKlwW7Kv2PypQZbv0cOX7gp/NH6dqU
   eWI7XBhd/UQnonZpPHGIdUK++Xh4UCp2xtW9EabBjKRMWy+uhv8UyFyqv
   GgHZBi/CfPdfwD8HlK9sRnFhRAKeAvrYpFelvywBC2rg6/bFO5RXNbc0u
   aidCQKbVLIlg/hjetzXfkd32KnHOPkSvt5zhGKTwpuzngweJKgK0g0URq
   w==;
X-CSE-ConnectionGUID: q4gr0J/6RsGzx3+I5nInxw==
X-CSE-MsgGUID: mEqBx//NSLeUtlPooq2tkQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11298"; a="23336238"
X-IronPort-AV: E=Sophos;i="6.12,271,1728975600"; 
   d="scan'208";a="23336238"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2024 19:08:23 -0800
X-CSE-ConnectionGUID: D+CKjTLMSH6sm2oASuhzBw==
X-CSE-MsgGUID: NEG2SNvRQgGteJoamc2Kcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,271,1728975600"; 
   d="scan'208";a="131134966"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 27 Dec 2024 19:08:23 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tRNBc-0003pk-0C;
	Sat, 28 Dec 2024 03:08:20 +0000
Date: Sat, 28 Dec 2024 11:07:31 +0800
From: kernel test robot <lkp@intel.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jarkko-tpmdd:v4l2-loopback 2/2]
 drivers/media/v4l2-core/v4l2-loopback.c:1894:4: warning: variable 'index' is
 uninitialized when used here
Message-ID: <202412281138.PEcKMet9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git v4l2-loopback
head:   b244bda01c33df5d583f0e2e6517b2bd7f87eb0e
commit: b244bda01c33df5d583f0e2e6517b2bd7f87eb0e [2/2] media: v4l2-loopback
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20241228/202412281138.PEcKMet9-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241228/202412281138.PEcKMet9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412281138.PEcKMet9-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/media/v4l2-core/v4l2-loopback.c:18:
   In file included from include/linux/mm.h:2223:
   include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     505 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     512 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     525 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/v4l2-core/v4l2-loopback.c:1894:4: warning: variable 'index' is uninitialized when used here [-Wuninitialized]
    1894 |                         index, buf->index, buf, buf->type, buf->bytesused,
         |                         ^~~~~
   drivers/media/v4l2-core/v4l2-loopback.c:95:35: note: expanded from macro 'dprintkrw'
      95 |                                task_pid_nr(current), ##args);          \
         |                                                        ^~~~
   include/linux/printk.h:501:60: note: expanded from macro 'printk'
     501 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                                                            ^~~~~~~~~~~
   include/linux/printk.h:473:19: note: expanded from macro 'printk_index_wrap'
     473 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                                 ^~~~~~~~~~~
   drivers/media/v4l2-core/v4l2-loopback.c:1849:11: note: initialize the variable 'index' to silence this warning
    1849 |         int index;
         |                  ^
         |                   = 0
   5 warnings generated.


vim +/index +1894 drivers/media/v4l2-core/v4l2-loopback.c

  1841	
  1842	/* put buffer to dequeue
  1843	 * called on VIDIOC_DQBUF
  1844	 */
  1845	static int vidioc_dqbuf(struct file *file, void *fh, struct v4l2_buffer *buf)
  1846	{
  1847		struct v4l2_loopback_device *dev;
  1848		struct v4l2_loopback_opener *opener;
  1849		int index;
  1850		struct v4l2l_buffer *b;
  1851	
  1852		dev = v4l2loopback_getdevice(file);
  1853		opener = fh_to_opener(fh);
  1854		if (opener->timeout_image_io) {
  1855			*buf = dev->timeout_image_buffer.buffer;
  1856			return 0;
  1857		}
  1858	
  1859		switch (buf->type) {
  1860		case V4L2_BUF_TYPE_VIDEO_CAPTURE:
  1861			index = get_capture_buffer(file);
  1862			if (index < 0)
  1863				return index;
  1864			dprintkrw("capture DQBUF pos: %lld index: %d\n",
  1865				  (long long)(opener->read_position - 1), index);
  1866			if (!(dev->buffers[index].buffer.flags &
  1867			      V4L2_BUF_FLAG_MAPPED)) {
  1868				dprintk("trying to return not mapped buf[%d]\n", index);
  1869				return -EINVAL;
  1870			}
  1871			unset_flags(&dev->buffers[index]);
  1872			*buf = dev->buffers[index].buffer;
  1873			dprintkrw(
  1874				"dqbuf(CAPTURE)#%d: buffer#%d @ %p type=%d bytesused=%d length=%d flags=%x field=%d timestamp=%lld.%06ld sequence=%d\n",
  1875				index, buf->index, buf, buf->type, buf->bytesused,
  1876				buf->length, buf->flags, buf->field,
  1877				(long long)buf->timestamp.tv_sec,
  1878				(long int)buf->timestamp.tv_usec, buf->sequence);
  1879			return 0;
  1880		case V4L2_BUF_TYPE_VIDEO_OUTPUT:
  1881			spin_lock_bh(&dev->list_lock);
  1882	
  1883			b = list_entry(dev->outbufs_list.prev, struct v4l2l_buffer,
  1884				       list_head);
  1885			list_move_tail(&b->list_head, &dev->outbufs_list);
  1886	
  1887			spin_unlock_bh(&dev->list_lock);
  1888			dprintkrw("output DQBUF index: %d\n", b->buffer.index);
  1889			unset_flags(b);
  1890			*buf = b->buffer;
  1891			buf->type = V4L2_BUF_TYPE_VIDEO_OUTPUT;
  1892			dprintkrw(
  1893				"dqbuf(OUTPUT)#%d: buffer#%d @ %p type=%d bytesused=%d length=%d flags=%x field=%d timestamp=%lld.%06ld sequence=%d\n",
> 1894				index, buf->index, buf, buf->type, buf->bytesused,
  1895				buf->length, buf->flags, buf->field,
  1896				(long long)buf->timestamp.tv_sec,
  1897				(long int)buf->timestamp.tv_usec, buf->sequence);
  1898			return 0;
  1899		default:
  1900			return -EINVAL;
  1901		}
  1902	}
  1903	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
