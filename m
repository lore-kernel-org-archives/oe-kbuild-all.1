Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 003E0149E15
	for <oe-kbuild-all@lists.linux.dev>; Sun, 18 Feb 2024 08:04:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708243501; cv=none; b=oLZZS0wUOvQzXgI4EvZRtXaVKG0k13J9/tqxyvtnNSXmhUvwVkDY8B3u+7JB/Cqp7g22/zsd3qeLD7tfmVCdvocDo8kzFZT0jrVqo1B1yFIgfr3M0R4A4Inb6bBfVW2Bn6HbxA2QBzWPOuwWVulGLvXvi7AeDW0Q0H00vHGtnwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708243501; c=relaxed/simple;
	bh=nXqtrdNHmrxIDqrMuWjltzRwb8x8pMN7v0q2CPa01/o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jjK7iQ1/g3clI+9vDtd4SnhKfSEAjQMLAhZtqlz1QXsGF6IcD+NIM4O14PuEI4o0XPSEaHKifXhH6EjtsGymoZ3IlSrwK0caHmdSvZmSDyQymMKOT56TIoybXCVw/lesmQzi9siYazmSNsPRRg/p7xFEaHoQj04BsjK9P/Cw/kk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CxFaenEN; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CxFaenEN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708243500; x=1739779500;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=nXqtrdNHmrxIDqrMuWjltzRwb8x8pMN7v0q2CPa01/o=;
  b=CxFaenENS2IlhzoccPz0pVMrS6DoOQQZ0c1TiKcc4dX8m2vq5Yylm20Y
   V+oRyvr6rgccrpZnjYHs81TJ1WqvytLoUwHuM839D0MLgjD+J9F3T2NVb
   Kewuj4OKhKDU3/PaqH6xqsSssIiLG0XQKjs/s+cjTvpVDsaPd+vy0My2L
   Ft2diOUnDjInBsq6mYcXVq/Pkz4egRK1VW0B9jPWMrmYxZsOPdOcKPLGS
   bf57xPa8YGRAday0IoLmt4vHKoEDXXKRyizffBStIuF5YU9j1WKhpRKtz
   7ZSQVjvLuw6HvWj+GaqXNuyPQ5Ha91VG7VcfyNrOpHCmmKUw/0CWkmbPM
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10987"; a="13732288"
X-IronPort-AV: E=Sophos;i="6.06,168,1705392000"; 
   d="scan'208";a="13732288"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2024 00:04:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10987"; a="826820588"
X-IronPort-AV: E=Sophos;i="6.06,168,1705392000"; 
   d="scan'208";a="826820588"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 18 Feb 2024 00:04:57 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rbc9p-0002sm-0S;
	Sun, 18 Feb 2024 08:04:23 +0000
Date: Sun, 18 Feb 2024 16:02:59 +0800
From: kernel test robot <lkp@intel.com>
To: Petr Tesarik <petrtesarik@huaweicloud.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC 7/8] KEYS: Run PGP key parser in a sandbox
Message-ID: <202402181524.uHqB4eFB-lkp@intel.com>
References: <20240216152435.1575-8-petrtesarik@huaweicloud.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240216152435.1575-8-petrtesarik@huaweicloud.com>

Hi Petr,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on herbert-cryptodev-2.6/master]
[also build test ERROR on herbert-crypto-2.6/master soc/for-next linus/master v6.8-rc4 next-20240216]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Petr-Tesarik/mpi-Introduce-mpi_key_length/20240216-233743
base:   https://git.kernel.org/pub/scm/linux/kernel/git/herbert/cryptodev-2.6.git master
patch link:    https://lore.kernel.org/r/20240216152435.1575-8-petrtesarik%40huaweicloud.com
patch subject: [RFC 7/8] KEYS: Run PGP key parser in a sandbox
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20240218/202402181524.uHqB4eFB-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240218/202402181524.uHqB4eFB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402181524.uHqB4eFB-lkp@intel.com/

All errors (new ones prefixed by >>):

>> crypto/asymmetric_keys/pgp_public_key.c:13:10: fatal error: linux/sbm.h: No such file or directory
      13 | #include <linux/sbm.h>
         |          ^~~~~~~~~~~~~
   compilation terminated.


vim +13 crypto/asymmetric_keys/pgp_public_key.c

  > 13	#include <linux/sbm.h>
    14	#include <keys/asymmetric-subtype.h>
    15	#include <keys/asymmetric-parser.h>
    16	#include <crypto/hash.h>
    17	#include <crypto/public_key.h>
    18	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
