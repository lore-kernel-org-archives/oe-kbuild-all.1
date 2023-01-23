Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5984624
	for <oe-kbuild-all@lists.linux.dev>; Mon, 23 Jan 2023 01:26:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674437210; x=1705973210;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6rVrYCxe62JE04mEsObn+ZtKAX/ZT45+XFxgFvls2iU=;
  b=XsCt+uiLPysl60UiGcTcf3uiACyvc43ns+7pi83312lfh8AFcwphrJMK
   ySRt7Av4O0qoL8gsL3DtFYLzekbvA2oCv+yOponJBE7ChRKfcpHuYVq7f
   1NqYEP7vYV9cvOPoHtWht0Y1N93kC8X81FW6IrUvpTeAFXPhxZHfYxEhp
   yvFBIVEYs4hcd7fmQ9aUkHJMn2ZtlEFrNLfYqZmKlnA0JU1XgGVSI0sYg
   NMcoFZ/emeFRIGXlAvGXduR8luPJbv3HyNfuXjTIrOdfGg6hQbOdhMUhP
   A5ebwl1dlbiO3EktXMth0N5IqiB7CG5iEVFNUPe7kNFcmSzqlQ5h8SI7L
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10598"; a="327223123"
X-IronPort-AV: E=Sophos;i="5.97,238,1669104000"; 
   d="scan'208";a="327223123"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2023 17:26:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10598"; a="785424962"
X-IronPort-AV: E=Sophos;i="5.97,238,1669104000"; 
   d="scan'208";a="785424962"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 22 Jan 2023 17:26:48 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pJlbk-0005Ks-0D;
	Mon, 23 Jan 2023 01:26:48 +0000
Date: Mon, 23 Jan 2023 09:25:52 +0800
From: kernel test robot <lkp@intel.com>
To: Johannes Berg <johannes.berg@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Richard Weinberger <richard@nod.at>,
	Sasha Levin <sashal@kernel.org>
Subject: [linux-stable-rc:linux-5.10.y 6860/9999] signal.c:undefined
 reference to `uml_pm_wake'
Message-ID: <202301230916.HJCKmEod-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Johannes,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-5.10.y
head:   cf1f70947a7fd1c296cfddc8809b26caf0188df2
commit: b58294ce1a8ac8e234abd991255b1d1905520aed [6860/9999] um: Allow PM with suspend-to-idle
config: um-allnoconfig (https://download.01.org/0day-ci/archive/20230123/202301230916.HJCKmEod-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git/commit/?id=b58294ce1a8ac8e234abd991255b1d1905520aed
        git remote add linux-stable-rc https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git
        git fetch --no-tags linux-stable-rc linux-5.10.y
        git checkout b58294ce1a8ac8e234abd991255b1d1905520aed
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=um olddefconfig
        make W=1 O=build_dir ARCH=um SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   /usr/bin/ld: warning: arch/x86/um/checksum_32.o: missing .note.GNU-stack section implies executable stack
   /usr/bin/ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   /usr/bin/ld: warning: vmlinux has a LOAD segment with RWX permissions
   /usr/bin/ld: arch/um/os-Linux/signal.o: in function `sigusr1_handler':
>> signal.c:(.text+0x211): undefined reference to `uml_pm_wake'
>> collect2: error: ld returned 1 exit status

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
