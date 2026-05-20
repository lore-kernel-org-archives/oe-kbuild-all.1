Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1DB8367B8B
	for <oe-kbuild-all@lists.linux.dev>; Wed, 20 May 2026 06:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779257336; cv=none; b=omoKIFM5iVUbzeJee4sxVVZ18S80vHbupuIbTaSAOUAb35b0DDxMMlUUATaD5Am/clwdSj+sqpGxi6sdGdNMd3MwFwjtSBoOxKLLVhdb6dgPYyjJxASplmYOHMPlseEDkdb9pp7bZ11ErdqFr91qkYE/EzodxvzWYLk4uuFaAlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779257336; c=relaxed/simple;
	bh=9V4VRYCqiY+R5E9hZdNTAy2YCcNKCHvcWaBJRPTTAyw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=mObBYX4DOXIv6tmb+gl309gIf2ITTNgdwoExlFplWo/LtheXSRy0jADbVBmcbXwsjj9VoYKYsMEXT9J5DMa3NuA9nFjgk4vrexwwGciZlk1xdTzg9QUDHOlb+At9zLxb7fMgniIxbnkgFfbOeU1XFbaVvp5QIqQARfonGzC4BrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GuHXt4XS; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GuHXt4XS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779257335; x=1810793335;
  h=date:from:to:cc:subject:message-id;
  bh=9V4VRYCqiY+R5E9hZdNTAy2YCcNKCHvcWaBJRPTTAyw=;
  b=GuHXt4XS+P2kHEswZOvR8/ajoVh3j+bacBEfuWURIvILrrRF8dnKTIao
   vb3VWZwEPW6pr7GWNlZdpglJyh4SmH6wThr1siAKQB+OJXRf1fSpUzNQv
   Lj1eSmWS9ethmGfNyB5Le8Cli2Ay/Nz5Cbna8ZQLo2OV67JCj1pOTgBMK
   Rfe9BLi1bVpE89KbuqP/WUpYSjDaD7QwlCwY3PL/jqFuUNIqngTPlowxz
   WHnrdnNyGODOExCbiKR6lGM5L0ILYY6SDIfz1aQ59r8CQMBvb972VKuVl
   TXXRpWR77mFu3jMrp4YBHYZkrMpoEMjPKCaOW6h71uc2KOGdv2z112gTM
   w==;
X-CSE-ConnectionGUID: 6C8JijmeTCK4hNxs0xYbUw==
X-CSE-MsgGUID: Nk92eIOlSG67Ee6paj08Bg==
X-IronPort-AV: E=McAfee;i="6800,10657,11791"; a="79996279"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="79996279"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2026 23:08:54 -0700
X-CSE-ConnectionGUID: PC8TZHWoRZ2YKZdMlHWlpQ==
X-CSE-MsgGUID: Gh3v2cHSQPazuNCrfORHWQ==
X-ExtLoop1: 1
Received: from lkp-server02.sh.intel.com (HELO 30e86e9c1927) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 19 May 2026 23:08:53 -0700
Received: from kbuild by 30e86e9c1927 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wPa6G-000000002az-1oTh;
	Wed, 20 May 2026 06:08:18 +0000
Date: Wed, 20 May 2026 14:05:44 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:iomap-fuse-prep 7/8]
 fs/iomap/buffered-io.c:2015:undefined reference to `iomap_add_to_ioend'
Message-ID: <202605201401.wxEhP1vF-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git iomap-fuse-prep
head:   d78140ae7e41edad8f0971778c7c21a6f3da650c
commit: 30ec00229eecd235b3b6bc15f6fd20bcf9a3670a [7/8] iomap: map writeback ranges with iomap ops
config: i386-buildonly-randconfig-002-20260520 (https://download.01.org/0day-ci/archive/20260520/202605201401.wxEhP1vF-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260520/202605201401.wxEhP1vF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605201401.wxEhP1vF-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: fs/iomap/buffered-io.o: in function `iomap_writeback_map':
>> fs/iomap/buffered-io.c:2015:(.text+0x298): undefined reference to `iomap_add_to_ioend'


vim +2015 fs/iomap/buffered-io.c

  1997	
  1998	ssize_t iomap_writeback_map(struct iomap_writepage_ctx *wpc,
  1999			struct folio *folio, u64 offset, unsigned int len, u64 end_pos,
  2000			const struct iomap_ops *ops)
  2001	{
  2002		struct iomap_iter iter = {
  2003			.inode		= wpc->inode,
  2004			.pos		= offset,
  2005			.len		= len,
  2006			.flags		= IOMAP_WRITEBACK,
  2007		};
  2008		ssize_t ret;
  2009	
  2010		while ((ret = iomap_iter(&iter, ops)) > 0)
  2011			iter.status = iomap_writeback_map_iter(&iter, wpc);
  2012		if (ret < 0 && ret != -ECANCELED)
  2013			return ret;
  2014	
> 2015		return iomap_add_to_ioend(wpc, folio, offset, end_pos, len);

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
