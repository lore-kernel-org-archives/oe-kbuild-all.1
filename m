Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78F031BDC1
	for <oe-kbuild-all@lists.linux.dev>; Wed,  4 Oct 2023 16:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696438211; x=1727974211;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BT3EjIlkQX8hMcj0MKr8gE58KMLtnut0LE32W/D6E0c=;
  b=d+oFzfKZYU4UcMmeI/Br/nQfYJqiBzzHiNJtQH3V+YDyGaJO4Mhg4bqq
   8UaaFteIAbnoMkWeFwU6fTRi1Pdp2whkM7wAQZOd8AoJXlp4lrQuwvoV4
   m5K4zor/AxeaewiUpuGYJetPJCR8y+xcAkNqz4ZS9AG9aYcM1/+Yb38X2
   kaiE/EzBqhmo3meU0wLn++xAqo7WfCjPATEDmepuo2/gKu86o2BkNTp44
   +65nzGGEFcdNY1WLrk1k0/jYJVWC0hevjNv/oxJCT7XucD9YbpDM17TzY
   00pmWVxzotW/L7mLGtMEye3Xy1Ob17jdUzbVyiJtbrIeTVWSgrFvI+RYw
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="363504174"
X-IronPort-AV: E=Sophos;i="6.03,200,1694761200"; 
   d="scan'208";a="363504174"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2023 09:50:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="841962422"
X-IronPort-AV: E=Sophos;i="6.03,200,1694761200"; 
   d="scan'208";a="841962422"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 04 Oct 2023 09:50:09 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qo54Y-000KQG-1g;
	Wed, 04 Oct 2023 16:50:06 +0000
Date: Thu, 5 Oct 2023 00:49:18 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:netfs-lib 31/34] buffered_write.c:undefined reference
 to `__fscache_clear_page_bits'
Message-ID: <202310050010.p4edg6YS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git netfs-lib
head:   8b08a7e2d3217f7054808246fc559c867f54a524
commit: aa134e2577a57c9f8137fc62bd7000c502447186 [31/34] netfs: Provide a writepages implementation
config: csky-randconfig-001-20231002 (https://download.01.org/0day-ci/archive/20231005/202310050010.p4edg6YS-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231005/202310050010.p4edg6YS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310050010.p4edg6YS-lkp@intel.com/

All errors (new ones prefixed by >>):

   csky-linux-ld: fs/netfs/buffered_write.o: in function `netfs_write_back_from_locked_folio':
>> buffered_write.c:(.text+0x1224): undefined reference to `__fscache_clear_page_bits'
   csky-linux-ld: fs/netfs/buffered_write.o: in function `netfs_writepages_begin':
   buffered_write.c:(.text+0x12f4): undefined reference to `__fscache_clear_page_bits'
   csky-linux-ld: fs/netfs/misc.o: in function `netfs_dirty_folio':
   misc.c:(.text+0x8c): undefined reference to `fscache_dirty_folio'
   csky-linux-ld: fs/netfs/misc.o: in function `netfs_xa_store_and_mark':
   misc.c:(.text+0x1b0): undefined reference to `fscache_dirty_folio'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
