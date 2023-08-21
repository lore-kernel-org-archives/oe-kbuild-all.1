Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2044E15C0
	for <oe-kbuild-all@lists.linux.dev>; Mon, 21 Aug 2023 14:37:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692628644; x=1724164644;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/+K4YL5+U3f6jXnyjNiGL4GrwAJWZyUXrWY93CCB+9c=;
  b=PECsefAaEyQ8A5+5VWMJ+3n3iuIPxToLcKXStoo0Qm4UCMxovKk3pkPQ
   WnnViohOt0X89yLNtNo/L0NiqzHyRIgKMSD+zn6kSvVdrHBnYv4dI1r+9
   z8Kx9rEli6I1s2Ho2/cbLXtdMl/wKk2gPcQmg+b9L5342Iv20RabQhedZ
   KBHQcuAxiteYv5fxs9AFHLZFa/vNEPRYww8enjbDRqQfuTEyB4yyYoK14
   U4JGVmCyQ7lqklt5qxREwKryCeokHyqzqYbXGhtpE8qGXm1oQ8BEB45Md
   pPDAK3UQKqW8x+Mp2akm+BDR3FFgBcYNxtL4PLgxxCr5Gfo/trOzeXCBz
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="373575829"
X-IronPort-AV: E=Sophos;i="6.01,190,1684825200"; 
   d="scan'208";a="373575829"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2023 07:37:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="735850882"
X-IronPort-AV: E=Sophos;i="6.01,190,1684825200"; 
   d="scan'208";a="735850882"
Received: from lkp-server02.sh.intel.com (HELO 6809aa828f2a) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 21 Aug 2023 07:37:21 -0700
Received: from kbuild by 6809aa828f2a with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qY61w-0000ae-2h;
	Mon, 21 Aug 2023 14:37:20 +0000
Date: Mon, 21 Aug 2023 22:36:49 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-5.4 27/54] net/bluetooth/mgmt.c:3112:16: error:
 implicit declaration of function 'hci_abort_conn_sync'; did you mean
 'abort_conn_sync'?
Message-ID: <202308212210.KCdYJbUz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-5.4
head:   aa831388bc642f05a5ed2cfdd4c746ae149bcac3
commit: 9fb783efd3d3ce57501de6575810418b4a21c71e [27/54] BACKPORT: Bluetooth: Move hci_abort_conn to hci_conn.c
config: mips-allmodconfig (https://download.01.org/0day-ci/archive/20230821/202308212210.KCdYJbUz-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230821/202308212210.KCdYJbUz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308212210.KCdYJbUz-lkp@intel.com/

Note: the chrome-os/chromeos-5.4 HEAD aa831388bc642f05a5ed2cfdd4c746ae149bcac3 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   net/bluetooth/mgmt.c: In function 'abort_conn_sync':
>> net/bluetooth/mgmt.c:3112:16: error: implicit declaration of function 'hci_abort_conn_sync'; did you mean 'abort_conn_sync'? [-Werror=implicit-function-declaration]
    3112 |         return hci_abort_conn_sync(hdev, conn, HCI_ERROR_REMOTE_USER_TERM);
         |                ^~~~~~~~~~~~~~~~~~~
         |                abort_conn_sync
   cc1: some warnings being treated as errors


vim +3112 net/bluetooth/mgmt.c

  3102	
  3103	static int abort_conn_sync(struct hci_dev *hdev, void *data)
  3104	{
  3105		struct hci_conn *conn;
  3106		u16 handle = PTR_ERR(data);
  3107	
  3108		conn = hci_conn_hash_lookup_handle(hdev, handle);
  3109		if (!conn)
  3110			return 0;
  3111	
> 3112		return hci_abort_conn_sync(hdev, conn, HCI_ERROR_REMOTE_USER_TERM);
  3113	}
  3114	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
