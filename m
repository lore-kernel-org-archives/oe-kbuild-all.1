Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8394BA57
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Jan 2023 23:51:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1673653883; x=1705189883;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=cviidunioLW6hGZnGXo/SqClTdLKiHXALZdzpVvxUpU=;
  b=H9WN9TsEZs/G059AZYh2EeTkZuhS9QBK6/zjc1GOYZNVfhupheL26rOY
   Dm++XQ3IPHYa4JFSV9cXGarfBtm/CmFFuj777545q3SaiOnHm3/71hnm0
   Nht1bLrJxmjKfnG6RGltKtrKtIzjTjXd0p4+56H/ETfdgbUa/O0x0RzOs
   dKeYoKiBN9zIyF04fcT/l69kI5BSleDj896MpwOYDQ1ceXJJB+vO1uoOP
   XXoITsCmUVnBKTo2cU5DZVNXBkFWIhpjTEliYeBaXOm8hQFcei9H0sV5K
   WkChmVALJNlMn1dIU4qHPSElJDNgXgwt+OBErnNOCnXYi1kmpioZbjCpb
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10589"; a="321829111"
X-IronPort-AV: E=Sophos;i="5.97,215,1669104000"; 
   d="scan'208";a="321829111"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2023 15:51:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10589"; a="635937814"
X-IronPort-AV: E=Sophos;i="5.97,215,1669104000"; 
   d="scan'208";a="635937814"
Received: from lkp-server02.sh.intel.com (HELO f1920e93ebb5) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 13 Jan 2023 15:51:21 -0800
Received: from kbuild by f1920e93ebb5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pGTpQ-000BXc-0V;
	Fri, 13 Jan 2023 23:51:20 +0000
Date: Sat, 14 Jan 2023 07:50:35 +0800
From: kernel test robot <lkp@intel.com>
To: Luis Chamberlain <mcgrof@kernel.org>
Cc: Josh Triplett <josh@joshtriplett.org>, lkp@intel.com,
 oe-kbuild-all@lists.linux.dev
Subject: [lkp] [+285 bytes kernel size regression] [i386-tinyconfig]
 [ede35ceeaa] fs: add iterate_supers_excl() and
 iterate_supers_reverse_excl()
Message-ID: <63c1ee4b.4jcobealgboVE+e2%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit


FYI, we noticed a +285 bytes kernel size regression due to commit:

commit: ede35ceeaaa43159e5a2f4effeb38cc62a1b0fb6 (fs: add iterate_supers_excl() and iterate_supers_reverse_excl())
https://git.kernel.org/cgit/linux/kernel/git/mcgrof/linux-next.git 20231010-fs-freeze-v3


Details as below (size data is obtained by `nm --size-sort vmlinux`):

42a7b144: fs: distinguish between user initiated freeze and kernel initiated freeze
ede35cee: fs: add iterate_supers_excl() and iterate_supers_reverse_excl()

+----------------------------------+----------+----------+-------+
|              symbol              | 42a7b144 | ede35cee | delta |
+----------------------------------+----------+----------+-------+
| nm.T.iterate_supers_reverse_excl | 0        | 143      | 143   |
| nm.T.iterate_supers_excl         | 0        | 142      | 142   |
| bzImage                          | 497056   | 497120   | 64    |
+----------------------------------+----------+----------+-------+



Thanks

