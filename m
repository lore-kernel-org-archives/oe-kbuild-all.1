Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96D8A2C9C
	for <oe-kbuild-all@lists.linux.dev>; Tue,  4 Apr 2023 09:49:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680601758; x=1712137758;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XdrAOxnXVXtiIIC4px7jMTUhlJWXOaO6uACJkkl6fM0=;
  b=NL33fRB0T3I+ogeGtp5USYAjFPhLZrerx86oZIpcjxSxvNxjKap2Jlwn
   yei6Oc13b1KHhvidG9inYs5ZE3Rqpu2NJKbYuPi/iB/UfQcic9WRx0IHp
   XeL5Pv1CyeIIGNQLGPkEbLeRhrd2Jhr3kxCn4XzBcO8/5iKcKbHOLYn1C
   QcJerDvsz3TJwIAlsVGznreR+Iq6D5ZSO3zCoDH7WHERNuMdWiK+WOKcE
   CU+kQ7KySGQi66rTTHU4k0iVdm4NwxGDCwCkDs9+Z/VTNBG4mWJsm6kgn
   Hi9fCbJRfgeQ/a/kISNoB9YMLzTQ4nsqV11xuZham1ji820Uq4YbgTI8x
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="330721591"
X-IronPort-AV: E=Sophos;i="5.98,317,1673942400"; 
   d="scan'208";a="330721591"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2023 02:49:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="663522375"
X-IronPort-AV: E=Sophos;i="5.98,317,1673942400"; 
   d="scan'208";a="663522375"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 04 Apr 2023 02:49:16 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pjdHq-000PVU-2j;
	Tue, 04 Apr 2023 09:49:10 +0000
Date: Tue, 4 Apr 2023 17:48:11 +0800
From: kernel test robot <lkp@intel.com>
To: Takahiro Itazuri <itazur@amazon.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Paolo Bonzini <pbonzini@redhat.com>, linux-doc@vger.kernel.org
Subject: [linux-next:master 8464/9010] htmldocs:
 Documentation/virt/kvm/api.rst:8303: WARNING: Field list ends without a
 blank line; unexpected unindent.
Message-ID: <202304041708.siWlxmyD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   6a53bda3aaf3de5edeea27d0b1d8781d067640b6
commit: c2594091d0e517f3c46b99a3f380cd7ae23e4ffc [8464/9010] docs: kvm: x86: Fix broken field list
reproduce:
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=c2594091d0e517f3c46b99a3f380cd7ae23e4ffc
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout c2594091d0e517f3c46b99a3f380cd7ae23e4ffc
        make menuconfig
        # enable CONFIG_COMPILE_TEST, CONFIG_WARN_MISSING_DOCUMENTS, CONFIG_WARN_ABI_ERRORS
        make htmldocs

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304041708.siWlxmyD-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Documentation/virt/kvm/api.rst:8303: WARNING: Field list ends without a blank line; unexpected unindent.

vim +8303 Documentation/virt/kvm/api.rst

ba7bb663f5547e David Dunn       2022-02-23  8298  
c2594091d0e517 Takahiro Itazuri 2023-03-31  8299  :Capability: KVM_CAP_PMU_CAPABILITY
ba7bb663f5547e David Dunn       2022-02-23  8300  :Architectures: x86
ba7bb663f5547e David Dunn       2022-02-23  8301  :Type: vm
ba7bb663f5547e David Dunn       2022-02-23  8302  :Parameters: arg[0] is bitmask of PMU virtualization capabilities.
ba7bb663f5547e David Dunn       2022-02-23 @8303  :Returns 0 on success, -EINVAL when arg[0] contains invalid bits
ba7bb663f5547e David Dunn       2022-02-23  8304  

:::::: The code at line 8303 was first introduced by commit
:::::: ba7bb663f5547ef474c98df99a97bb4a13c5715f KVM: x86: Provide per VM capability for disabling PMU virtualization

:::::: TO: David Dunn <daviddunn@google.com>
:::::: CC: Paolo Bonzini <pbonzini@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
