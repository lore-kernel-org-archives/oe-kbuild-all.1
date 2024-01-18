Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 652B75395
	for <oe-kbuild-all@lists.linux.dev>; Thu, 18 Jan 2024 02:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705545029; cv=none; b=Ppk8ShUBEdPwYV5lyiWZ0FtjILXhVNF5dG4cbcXU9CEEdw46+9yalK8NdBjAznd/8ZxHS5Qpg7bbkw94axdXz+3nyzGq5HOkMfX1oe4VZL35Ms85BodmVPQpMeI2O4n0pic2Olq28b3hyJqmOautnwWZ8Tu07dCSf408/oJ9LYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705545029; c=relaxed/simple;
	bh=2qNVb19vucvK1uTaTw/003I1P0DzTMhIJcQfHhNv48w=;
	h=DKIM-Signature:X-IronPort-AV:X-IronPort-AV:Received:X-ExtLoop1:
	 X-IronPort-AV:X-IronPort-AV:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:MIME-Version:Content-Type:Content-Disposition;
	b=YXzy2V86FDn9xYQukloAXuP46H3Uzj3hE8/qolr55Kn62F24ldbd5kEXp7AqiPTXfDgBR1RfZsK6ZS/8o5SqMXl3YTJaf4GHYNr84YMRyiVNQeK/cMYs+ddF09hoS2WXVr2sYmL5Gejmc9SeamDU/9jgPgYHRf7r3TAQdDlVtCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D8ar+sXC; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D8ar+sXC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705545027; x=1737081027;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2qNVb19vucvK1uTaTw/003I1P0DzTMhIJcQfHhNv48w=;
  b=D8ar+sXC5g+q7H8o++kxHKhWhpvOHyIMS7ioJYEulA/9slSubcNzhO/F
   zSjvhlr7OyQC0qa2ojvrJI4V3+LO1YZGNW3jumNLbYbyPTcoNffhmTt/3
   GVJacobyIl3qHnQx5BHnGnfCcgM42Fl8cDRAYWZIvG1Mwz53FA3BUgU8a
   DEhSza5WpG8BKYPIDNfK96+kRdXmpAwC5nWAFR6B2ZMKozVv1Ky3XjDID
   8vQ305FW4tz/RPy0WCjLE9qvCenQbPUsTbuX3xtqLCas9BQb8LsCIN5AK
   SlihN+nSqZmD+tIXGx1Hn7aZVd8C25rii9rPky9pf9tY4lZ9DPXSJ4pls
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="7027141"
X-IronPort-AV: E=Sophos;i="6.05,201,1701158400"; 
   d="scan'208";a="7027141"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2024 18:30:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="734139575"
X-IronPort-AV: E=Sophos;i="6.05,201,1701158400"; 
   d="scan'208";a="734139575"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 17 Jan 2024 18:30:25 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rQIAh-0002X8-1q;
	Thu, 18 Jan 2024 02:30:23 +0000
Date: Thu, 18 Jan 2024 10:29:36 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <groeck@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jsarha:topic/cros-sof-v4.19 62/6555]
 drivers/input/keyreset.c:213:5: warning: no previous prototype for
 'keyreset_remove'
Message-ID: <202401181016.NtMYtX1F-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jsarha/linux topic/cros-sof-v4.19
head:   d7a3e91d8d16d1ef8653deec5a1fffc4de034a0c
commit: fa50e390aa4e9f5596734b01f927e5dca1f19843 [62/6555] ANDROID: input: keyreset: Add keyreset driver.
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20240118/202401181016.NtMYtX1F-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240118/202401181016.NtMYtX1F-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401181016.NtMYtX1F-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/input/keyreset.c:213:5: warning: no previous prototype for 'keyreset_remove' [-Wmissing-prototypes]
     213 | int keyreset_remove(struct platform_device *pdev)
         |     ^~~~~~~~~~~~~~~


vim +/keyreset_remove +213 drivers/input/keyreset.c

   212	
 > 213	int keyreset_remove(struct platform_device *pdev)
   214	{
   215		struct keyreset_state *state = platform_get_drvdata(pdev);
   216		input_unregister_handler(&state->input_handler);
   217		kfree(state);
   218		return 0;
   219	}
   220	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
