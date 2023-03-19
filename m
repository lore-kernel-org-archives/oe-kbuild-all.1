Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBF3A363
	for <oe-kbuild-all@lists.linux.dev>; Sun, 19 Mar 2023 08:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679214605; x=1710750605;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=u2AuYsz0a+khNElyuP4Ak1WSzgosxn+0nviXy+xauso=;
  b=lUe3ZkT7Mfdjcr0aiYemmqlbazDfe8X/lIR5fD9H4Umk6x4i9nc2uHuN
   Du9o0aIg8HGSSkLW1mW+tKoMsUcf3/dvDCUtaghZcZ10dKKoXNduyRGj0
   zzfpkIm21+PwoCS8HcPh4z9RwHUIPDhW+QwuQEM7E4oxZlEi6hjM9Ma8n
   RWXWV/SyXgsw3SImF8myL+W7do3f56dhDdqYsfRzEtr2ChbDBZqdKVngz
   PL6AtGdNfzsYIdzJPRJ4g/uqm8EH3Y6xTrfbVY4rv8+ADQMjVwWi+Ytc5
   GiYZdT+5N+Ek4d2m72cqE5DSiDTSxhyFKk9tiqUR5OV7T7siSx0jz6Ejz
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10653"; a="424766629"
X-IronPort-AV: E=Sophos;i="5.98,273,1673942400"; 
   d="scan'208";a="424766629"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2023 01:30:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10653"; a="769851626"
X-IronPort-AV: E=Sophos;i="5.98,273,1673942400"; 
   d="scan'208";a="769851626"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 19 Mar 2023 01:30:04 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pdoQV-000AT0-1s;
	Sun, 19 Mar 2023 08:30:03 +0000
Date: Sun, 19 Mar 2023 16:29:05 +0800
From: kernel test robot <lkp@intel.com>
To: Lorenzo Stoakes <lstoakes@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, lkp@intel.com,
	Josh Triplett <josh@joshtriplett.org>
Subject: [lkp] [+328 bytes kernel size regression] [i386-tinyconfig]
 [1b7c843021] mm: vmalloc: use rwsem, mutex for vmap_area_lock and
 vmap_block->lock
Message-ID: <ZBbH0eLnZ7Y285ae@a245b58858a4>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6c7f1ac0aeb55faaa46a09108d3999e4595870d9.1679209395.git.lstoakes@gmail.com>


FYI, we noticed a +328 bytes kernel size regression due to commit:

commit: 1b7c843021466759acc93c26bf63bfdabf51398c (mm: vmalloc: use rwsem, mutex for vmap_area_lock and vmap_block->lock)
url: https://github.com/intel-lab-lkp/linux/commits/Lorenzo-Stoakes/fs-proc-kcore-Avoid-bounce-buffer-for-ktext-data/20230319-151114
patch link: https://lore.kernel.org/all/6c7f1ac0aeb55faaa46a09108d3999e4595870d9.1679209395.git.lstoakes@gmail.com/
patch subject: [PATCH v2 2/4] mm: vmalloc: use rwsem, mutex for vmap_area_lock and vmap_block->lock


Details as below (size data is obtained by `nm --size-sort vmlinux`):

fcb76393: fs/proc/kcore: Avoid bounce buffer for ktext data
1b7c8430: mm: vmalloc: use rwsem, mutex for vmap_area_lock and vmap_block->lock

+----------------------------------+----------+----------+-------+
|              symbol              | fcb76393 | 1b7c8430 | delta |
+----------------------------------+----------+----------+-------+
| bzImage                          | 501536   | 501760   | 224   |
| nm.t.vb_free                     | 178      | 210      | 32    |
| nm.T.find_vmap_area              | 6        | 36       | 30    |
| nm.t.purge_fragmented_blocks     | 276      | 306      | 30    |
| nm.T.vread                       | 345      | 373      | 28    |
| nm.t.vb_alloc                    | 196      | 222      | 26    |
| nm.t.find_unlink_vmap_area       | 49       | 73       | 24    |
| nm.t.alloc_vmap_area             | 1264     | 1288     | 24    |
| nm.t.free_vmap_block             | 117      | 140      | 23    |
| nm.t.__get_vm_area_node          | 218      | 240      | 22    |
| nm.t._vm_unmap_aliases           | 148      | 168      | 20    |
| nm.t.free_vmap_area              | 676      | 696      | 20    |
| nm.t.new_vmap_block              | 339      | 357      | 18    |
| nm.d.vmap_area_lock              | 0        | 16       | 16    |
| nm.t.vmap_ram_vread              | 259      | 272      | 13    |
| nm.T.remap_vmalloc_range_partial | 164      | 166      | 2     |
+----------------------------------+----------+----------+-------+



Thanks


