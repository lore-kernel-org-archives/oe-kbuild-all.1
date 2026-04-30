Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AFFD28851C
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Apr 2026 21:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777585341; cv=none; b=UkULpee1m8b7AOBdaoWDzRm/7irOVReiarjsSyZBKLy00H8YB+xPAx6UMW+AjPBHix5tW3akO4n3y3Mehh4GVHr/eVH37MHIHkyH9C39HbtRl4QtADAPaVKTARDF/Ru/EcRXvoUvp2xHkR2UtIM4Hp2GhjmSYx9CB5+z0U3b4Sc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777585341; c=relaxed/simple;
	bh=U6iNNOFFsgL+NI6vv7A2OhS0N5dSFv1SOoPYbU/db7E=;
	h=Date:From:To:Cc:Subject:Message-ID; b=BK+U1NpYnUtCbIKS7BdtrEvjJZnGqWZn17Fj813GXedRrmSyf44pBbtfn/tUuuK8vwotIAUQ5tcLX7LgwhqjuMrP6XGCrYbmUq3P3nQ2TtW0Y9kMQ4/Wo7QhwtGkhxKqZFyw0uvJ/LRSwqnILDUZDguPEXls07pC4VYMWIrEaeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kXsJGLJe; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kXsJGLJe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777585340; x=1809121340;
  h=date:from:to:cc:subject:message-id;
  bh=U6iNNOFFsgL+NI6vv7A2OhS0N5dSFv1SOoPYbU/db7E=;
  b=kXsJGLJehxGclTCF4yH32MIaWR5OptcDrqQ7wivcoO38sAJv2BJZM5A7
   Ycs8YzUfcl461OHHpzZZ4uSpqhXJqKI9iCkS33j+s9b8evAIgaXPWDMeu
   6Lxn5UMX0GcF4SugRNpiZjFegmUIcjxhVTS43wweMpWLZk3BM+/54DFJb
   XEIRGRoox8SXQ+A99iuw76sevBtBhG6Pnfs0+hrm1ENY+D7igUJWB4iQM
   3emTqFBzJme1j7J9r17pvjFEf5yzasqDZECGgTESOfftigvAB9ppQhOJn
   ml93USWsvb++c+uPc5f8MitmGz+8HUjKmumN95C+7iK8oqBdLyh69x0Px
   A==;
X-CSE-ConnectionGUID: KmZHylUtSUif+7hAO58nAw==
X-CSE-MsgGUID: 0Fvo9n6ITZuLxGyypERZUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11772"; a="88865336"
X-IronPort-AV: E=Sophos;i="6.23,208,1770624000"; 
   d="scan'208";a="88865336"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2026 14:42:19 -0700
X-CSE-ConnectionGUID: Jr3b95l1QjmOdiAmVSxE1A==
X-CSE-MsgGUID: m7XQK/ACRCyNTSTB7zfZfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,208,1770624000"; 
   d="scan'208";a="231573938"
Received: from lkp-server01.sh.intel.com (HELO aa799cca880d) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 30 Apr 2026 14:42:17 -0700
Received: from kbuild by aa799cca880d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wIZ9D-00000000CzQ-0WlG;
	Thu, 30 Apr 2026 21:42:15 +0000
Date: Fri, 01 May 2026 05:41:42 +0800
From: kernel test robot <lkp@intel.com>
To: DaeMyung Kang <charsyam@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Steve French <stfrench@microsoft.com>
Subject: [samba-ksmbd:ksmbd-for-next 3/8] Warning:
 fs/smb/server/connection.c:129 function parameter 'conn' not described in
 'ksmbd_conn_get'
Message-ID: <202605010544.XYsOMzha-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   git://git.samba.org/ksmbd.git ksmbd-for-next
head:   35e13b6abe0e7cb0ed6a1db71fb9e1cd89f92588
commit: 9ed98bea2b16ff115d34e375cdb0a119a6d6a2a3 [3/8] ksmbd: centralize ksmbd_conn final release to plug transport leak
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20260501/202605010544.XYsOMzha-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260501/202605010544.XYsOMzha-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605010544.XYsOMzha-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: fs/smb/server/connection.c:129 function parameter 'conn' not described in 'ksmbd_conn_get'
>> Warning: fs/smb/server/connection.c:148 function parameter 'conn' not described in 'ksmbd_conn_put'
>> Warning: fs/smb/server/connection.c:129 function parameter 'conn' not described in 'ksmbd_conn_get'
>> Warning: fs/smb/server/connection.c:148 function parameter 'conn' not described in 'ksmbd_conn_put'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
