Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793170892;
	b=ORQNrSYLhCb1L55nLuIf9PtNLPAVPxr1N9eRTtfL77dgqgf4uu2TpCSHfmpV8dwtv1Oa
	 dQWWuVtF+PkpN0el/bAuEHe+rvJlQMUnUuDwX2OcXN2V7ROqgnEnoJ/kXu0Sq7eu76Mnu
	 T+m5MQq4z2bhpHUkrQfECuKnK+AvS8No6q4kBVqJoh7kp2x1+kzejb5tHAj9KmZ4/wQQF
	 fFWGA8GL+lIDbOwGdGMf+fRFG0bI39UwWzlV9TEbPrV7C+QO2SAQstzz4eomH9iMCF+1y
	 L9cDhoDembTeJBmu1kdq/oY79uEP3TTyZzbTvxD+7VJgqnZI3SuUySt557H+WobS+Ww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793170892;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=+4M1wAiwmnZc4+eGuqWDVmiK42ul75CAs1At1Ixtl9k=;
	b=T65WYIDCXjkBZMUzINN0jt6cDpDuIVDBjU/R25zSWQpqtdtJOjvFjYA0zzFe0WfWnhQh
	 4OF5bADtPhjB34iEY12fIq50NXprqnncVQcLs9bX26QfEeD41h1KiiebQRsuBDY+0jGT0
	 6BvFFnn0JXLKHZ9ZDdxxlpcUmWxNx/YCbS5yMCXjkxCgjqL9SHNBrcrx7ta60ZSvv9wna
	 gOuUehg2iwcP1J9NrIwODQRn9Qsqq60CiikmFHRUumMMl1qMrBXM+E3i/53mzHUxQ+GZQ
	 GvaWsy++sgb0BUczddyLeFEg8EMjO/FwdtB3js+QVAPXas+ube+n5CdHcwH+B0fNAew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=egHZc904;
	arc=none smtp.remote-ip=192.198.163.11
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E03D7606A31A
	for <oe-kbuild-all@lists.linux.dev>; Wed, 28 Oct 2026 07:01:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E03D7606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=egHZc904
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793170890; x=1824706890;
  h=date:from:to:cc:subject:message-id;
  bh=ng7w0B8u24BRQv5WxPw79cUam7rCEVE1FGKq+mgSRiQ=;
  b=egHZc904DtUUJX/uoua1AgShceNFtA0dEPrFlUMKo2qPKFXWwjLlHV8k
   dQ/dnZ2NdrB+I05/y55mT1IRshVcGKMy8DUU93MtUCJfjRbMax4wfAp9w
   7N+IVVoU3ovsuRft0K6S7q6RHtTzJBeUFX6PTHCHegIzGxn4sSu7Wg9lh
   Q8YSxKO2O3hY4h25zL4CZv0SinLxgKRImPmiVgJkcd/G/z6P01RSiRmYD
   j22vN9Q0BSVm0d7D4VvEw9AfuyrCaDeoQf0laHmlvfDx7mjglathX0kEA
   waLZhyxtZFzZWDQ7aH+JU1kXWOwr0kkAeG5iT4GQLYNqEruUqbi2ow2/o
   w==;
X-CSE-ConnectionGUID: BLp6oyIwTX2BsiXsoTYTVQ==
X-CSE-MsgGUID: /PU27am1Q92WIuOiVzENVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="1791448"
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="1791448"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2026 00:01:30 -0700
X-CSE-ConnectionGUID: copyioSWTq29/URpYtiDGg==
X-CSE-MsgGUID: 41BTirSCRK+rteMg3WfnhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="4855662"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 28 Oct 2026 00:01:28 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xLxf4-000000004nH-07vS;
	Wed, 28 Oct 2026 07:01:26 +0000
Date: Wed, 28 Oct 2026 08:01:09 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18-kminext 1/1]
 drivers/mtd/nand/spi/winbond.c:369:2-3: Unneeded semicolon
Message-ID: <202610280729.2omK56gb-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://android.googlesource.com/kernel/common android17-6.18-kminext
head:   2cb883efa988e481f8a853178ec792f6fe49969e
commit: 52aaa647b02d0f9f81a36746e244ded9e82214f2 [1/1] mtd: spinand: Give the bus interface to the configuration helper
config: x86_64-randconfig-2104-20261028 (https://download.01.org/0day-ci/archive/20261028/202610280729.2omK56gb-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610280729.2omK56gb-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/mtd/nand/spi/winbond.c:369:2-3: Unneeded semicolon

vim +369 drivers/mtd/nand/spi/winbond.c

   353	
   354	static int w35n0xjw_vcr_cfg(struct spinand_device *spinand,
   355				    enum spinand_bus_interface iface)
   356	{
   357		const struct spi_mem_op *ref_op;
   358		unsigned int dummy_cycles;
   359		bool dtr, single;
   360		u8 io_mode;
   361		int ret;
   362	
   363		switch (iface) {
   364		case SSDR:
   365			ref_op = spinand->ssdr_op_templates.read_cache;
   366			break;
   367		default:
   368			return -EOPNOTSUPP;
 > 369		};
   370	
   371		dummy_cycles = ((ref_op->dummy.nbytes * 8) / ref_op->dummy.buswidth) /
   372			(ref_op->dummy.dtr ? 2 : 1);
   373		switch (dummy_cycles) {
   374		case 8:
   375		case 12:
   376		case 16:
   377		case 20:
   378		case 24:
   379		case 28:
   380			break;
   381		default:
   382			return -EINVAL;
   383		}
   384		ret = w35n0xjw_write_vcr(spinand, W35N01JW_VCR_DUMMY_CLOCK_REG, dummy_cycles);
   385		if (ret)
   386			return ret;
   387	
   388		single = (ref_op->cmd.buswidth == 1 &&
   389			  ref_op->addr.buswidth == 1 &&
   390			  ref_op->data.buswidth == 1);
   391		dtr = (ref_op->cmd.dtr && ref_op->addr.dtr && ref_op->data.dtr);
   392		if (single && !dtr)
   393			io_mode = W35N01JW_VCR_IO_MODE_SINGLE_SDR;
   394		else if (!single && !dtr)
   395			io_mode = W35N01JW_VCR_IO_MODE_OCTAL_SDR;
   396		else if (!single && dtr)
   397			io_mode = W35N01JW_VCR_IO_MODE_OCTAL_DDR;
   398		else
   399			return -EINVAL;
   400	
   401		ret = w35n0xjw_write_vcr(spinand, W35N01JW_VCR_IO_MODE_REG, io_mode);
   402		if (ret)
   403			return ret;
   404	
   405		return 0;
   406	}
   407	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
