Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EE7B1102
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Jan 2023 04:42:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674621764; x=1706157764;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=/GspP0PGWxoDUpHRn487463EpSk1GSgBHpPHULKHEx8=;
  b=LKFnHeCj2cl0nqTTnuIxzpAetvUqHPNjkmW5lj4TC13umVxmE12xL0tw
   FCoLvO9q+sf4zT9PE6AKjTqJmr5evQQdZLz4ohgLiU40DYvkdE/l4oI5O
   9Em/7TEC/FouDF/k6zInLjVdgA8zdM4UFP+6i99J3h4/bRIun2iSMHW0L
   TzpxOg+DQ8swRi5azN8K8gx3CQ/dawOxUx54fMiDFgFQKSdI/Coc3EbCm
   F+huN8UbuEYmlMI2MfkcpeU9pKAIBmhiNm+72ZN+WLMGkajPP3czjfBKZ
   Mm/ZW4t+Gk2NXOrxl+mJGNXfkE928ttWWIba37kSkMSmvesdeTQ5Ala0N
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10600"; a="327736932"
X-IronPort-AV: E=Sophos;i="5.97,244,1669104000"; 
   d="scan'208";a="327736932"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2023 20:42:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10600"; a="694612352"
X-IronPort-AV: E=Sophos;i="5.97,244,1669104000"; 
   d="scan'208";a="694612352"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 24 Jan 2023 20:42:42 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pKXcP-00072S-2Z;
	Wed, 25 Jan 2023 04:42:41 +0000
Date: Wed, 25 Jan 2023 12:42:26 +0800
From: kernel test robot <lkp@intel.com>
To: Eric Biggers <ebiggers@google.com>
Cc: Josh Triplett <josh@joshtriplett.org>, lkp@intel.com,
 oe-kbuild-all@lists.linux.dev
Subject: [lkp] [+163 bytes kernel size regression] [i386-tinyconfig]
 [aec9937c0b] x86: enable Data Operand Independent Timing Mode
Message-ID: <63d0b332.nxvHFCjCbjsG+m8h%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit


FYI, we noticed a +163 bytes kernel size regression due to commit:

commit: aec9937c0b0d8be7fa060366d802d95ffa629ffd (x86: enable Data Operand Independent Timing Mode)
https://git.kernel.org/cgit/linux/kernel/git/ebiggers/linux.git x86-pending


Details as below (size data is obtained by `nm --size-sort vmlinux`):

fb6e71db: Merge tag 'nfsd-6.2-5' of git://git.kernel.org/pub/scm/linux/kernel/git/cel/linux
aec9937c: x86: enable Data Operand Independent Timing Mode

+--------------------------------------+----------+----------+-------+
|                symbol                | fb6e71db | aec9937c | delta |
+--------------------------------------+----------+----------+-------+
| bzImage                              | 495872   | 495968   | 96    |
| nm.t.doitm_parse_cmdline             | 0        | 47       | 47    |
| nm.T.update_doitm_msr                | 0        | 37       | 37    |
| nm.T.check_bugs                      | 939      | 971      | 32    |
| nm.t.cpu_set_bug_bits                | 639      | 659      | 20    |
| nm.d.__setup_doitm_parse_cmdline     | 0        | 12       | 12    |
| nm.d.__setup_str_doitm_parse_cmdline | 0        | 6        | 6     |
| nm.T.identify_secondary_cpu          | 47       | 52       | 5     |
| nm.W.cpu_show_dodt                   | 0        | 3        | 3     |
| nm.d.doitm_off                       | 0        | 1        | 1     |
+--------------------------------------+----------+----------+-------+



Thanks

