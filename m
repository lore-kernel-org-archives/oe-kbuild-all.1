Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 216F41C16
	for <oe-kbuild-all@lists.linux.dev>; Sun, 11 Dec 2022 14:16:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1670768182; x=1702304182;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=weXKnUFVBrUQ4Hj60AjrMc3uuGPlniJwW5D0wHsmhXQ=;
  b=JAQFpAEni3UofYwOYAcO2vH2OSLiwnqJyfNpIS3FlKt3GKEYaO34bsRj
   ranEHIAK93RHCXqAy+whtlqKuW82X75aE7dMcRULdK6L0dVbxE4jadZG3
   /FydncIIXyAo4EcPQzaxcNAP6+8JXRrj948osnWgh2POTRNIxNEb+zUTO
   wsicGLIDqmMYsOCqYC27HzbGQvFZxFj86x+pjLfDJuOXquW+Khhe6Is4g
   cS7GU3m/gipVcbV5BbTyJFizy48bfLzuGLW3sS7k4mlYY7rtodSk6Xa79
   rpUynjV8OgQDI1IApmqrI9HfquEpIv/XZDfMTURsgjwjH8vgBS4phtGAv
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10558"; a="297381136"
X-IronPort-AV: E=Sophos;i="5.96,236,1665471600"; 
   d="scan'208";a="297381136"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2022 06:16:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10558"; a="754621009"
X-IronPort-AV: E=Sophos;i="5.96,236,1665471600"; 
   d="scan'208";a="754621009"
Received: from lkp-server01.sh.intel.com (HELO b5d47979f3ad) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 11 Dec 2022 06:16:20 -0800
Received: from kbuild by b5d47979f3ad with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1p4N7r-00035q-1l;
	Sun, 11 Dec 2022 14:16:19 +0000
Date: Sun, 11 Dec 2022 22:15:57 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>,
 <mat.jonczyk@o2.pl>
Cc: Josh Triplett <josh@joshtriplett.org>, lkp@intel.com,
 oe-kbuild-all@lists.linux.dev
Subject: [lkp] [+149 bytes kernel size regression] [i386-tinyconfig]
 [e210f330b7] rtc: mc146818-lib: extract mc146818_avoid_UIP
Message-ID: <6395e61d.KJpCUsn01fj82Mkl%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit


FYI, we noticed a +149 bytes kernel size regression due to commit:

commit: e210f330b739084390a722e33107d81715b59ed7 (rtc: mc146818-lib: extract mc146818_avoid_UIP)
https://git.kernel.org/cgit/linux/kernel/git/stable/linux-stable-rc.git queue/5.15


Details as below (size data is obtained by `nm --size-sort vmlinux`):

23ed3f68: mm/khugepaged: invoke MMU notifiers in shmem/file collapse paths
e210f330: rtc: mc146818-lib: extract mc146818_avoid_UIP

+-------------------------+----------+----------+-------+
|         symbol          | 23ed3f68 | e210f330 | delta |
+-------------------------+----------+----------+-------+
| nm.T.mc146818_avoid_UIP | 0        | 149      | 149   |
| bzImage                 | 467792   | 467856   | 64    |
+-------------------------+----------+----------+-------+



Thanks

