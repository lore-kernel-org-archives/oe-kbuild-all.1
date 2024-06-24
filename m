Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 016A319CD14
	for <oe-kbuild-all@lists.linux.dev>; Mon, 24 Jun 2024 15:48:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719244097; cv=none; b=PJ2Y1WIp55zKYUJQpB0addnPjC+OxqbwOyPmGdn1x8tbk7VelI9QCu5LtJAlcsqEqEk9wM9Bah+XT1gULwrSHsqvAElmJow4uLduDoW52ADSSa1bBd1bGa0ChYAO1O8iAAxb0W6gPGt5IVWkUthCx7Cay10JUju/ZOmTwdcw3eE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719244097; c=relaxed/simple;
	bh=YRYUC0HMF2KwFmcugasRZxWY7sjs9NPpzb3+AwCU8Vk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TfFSyMfQ+F7+Ak5+JzBbTwogslv98rmhqj5uGsLIP0qW077WoSIEAOFQGFP1Ltvu8Hr+zIR3arndkbzz19GvZRRmLjqc6FnTpTyqbqVK3lYvZrmSyvAlDsdVoNQtluOShWShW77rkl0AtG3m8Dhp7Ug81oHG+iLRNoY0KK7F7Vo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=erhuIlM6; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="erhuIlM6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719244096; x=1750780096;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YRYUC0HMF2KwFmcugasRZxWY7sjs9NPpzb3+AwCU8Vk=;
  b=erhuIlM6VPMzLZFbFG9m4AnyebJDdIAf5XfdxffQXlv07Az3cjQXGr/n
   lRT5qlHV2HsQiJYunOnJp/1HWhP46o2FQRR4hWZvsppXymPPw6OE5gcwJ
   C6wLbvxRqfDvha/Ja1hsF3YW/sIHruWLJWrcow3BBxUlNpxfaJQ8kVsY4
   uFDwJohdfmwbPgwln+0k0093k6pz+BKqk6Uv7+oRsTg74kJ4TVtZBY0wM
   37LclkokVLWy8pJ7foLLXshRs1ZfB0TWpjyVE0jWqiygJi59aEMnDS9FT
   uCBgyUO3tkizmS3kxSD8CNs87MoG9dB+cJ/zOWcJPhL/6ypLlKLpqTKnM
   w==;
X-CSE-ConnectionGUID: Hroyi8HNTCyA5pQIPGqIEA==
X-CSE-MsgGUID: tkCINYyDRRSU5ZaakdH7nQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11113"; a="26907444"
X-IronPort-AV: E=Sophos;i="6.08,262,1712646000"; 
   d="scan'208";a="26907444"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2024 08:48:13 -0700
X-CSE-ConnectionGUID: NBwMbeHgQ46tyAFR7kTWAQ==
X-CSE-MsgGUID: yoHLtu3eThmulKLT8aPrGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,262,1712646000"; 
   d="scan'208";a="44007754"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 24 Jun 2024 08:48:13 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sLlvO-000DTO-1A;
	Mon, 24 Jun 2024 15:48:10 +0000
Date: Mon, 24 Jun 2024 23:48:04 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:netfs-writeback 16/16] fs/netfs/main.c:65:26: warning:
 format '%d' expects argument of type 'int', but argument 7 has type 'long
 int'
Message-ID: <202406242323.j0EybX2J-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git netfs-writeback
head:   4058083df1dc58322ad2ec98bcd218a43c8befac
commit: 4058083df1dc58322ad2ec98bcd218a43c8befac [16/16] netfs: Speed up buffered reading
config: i386-buildonly-randconfig-001-20240624 (https://download.01.org/0day-ci/archive/20240624/202406242323.j0EybX2J-lkp@intel.com/config)
compiler: gcc-8 (Ubuntu 8.4.0-3ubuntu2) 8.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240624/202406242323.j0EybX2J-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406242323.j0EybX2J-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/netfs/main.c: In function 'netfs_requests_seq_show':
>> fs/netfs/main.c:65:26: warning: format '%d' expects argument of type 'int', but argument 7 has type 'long int' [-Wformat=]
         "%08x %s %3d %2lx %4d @%04llx %llx/%llx",
                           ~~^
                           %4ld
   fs/netfs/main.c:70:6:
         rreq->error,
         ~~~~~~~~~~~          


vim +65 fs/netfs/main.c

    47	
    48	/*
    49	 * Generate a list of I/O requests in /proc/fs/netfs/requests
    50	 */
    51	static int netfs_requests_seq_show(struct seq_file *m, void *v)
    52	{
    53		struct netfs_io_request *rreq;
    54	
    55		if (v == &netfs_io_requests) {
    56			seq_puts(m,
    57				 "REQUEST  OR REF FL ERR  COVERAGE\n"
    58				 "======== == === == ==== =========\n"
    59				 );
    60			return 0;
    61		}
    62	
    63		rreq = list_entry(v, struct netfs_io_request, proc_link);
    64		seq_printf(m,
  > 65			   "%08x %s %3d %2lx %4d @%04llx %llx/%llx",
    66			   rreq->debug_id,
    67			   netfs_origins[rreq->origin],
    68			   refcount_read(&rreq->ref),
    69			   rreq->flags,
    70			   rreq->error,
    71			   rreq->start, rreq->submitted, rreq->len);
    72		seq_putc(m, '\n');
    73		return 0;
    74	}
    75	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
