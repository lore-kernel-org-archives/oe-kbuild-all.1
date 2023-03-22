Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 187D98F58
	for <oe-kbuild-all@lists.linux.dev>; Wed, 22 Mar 2023 17:06:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679504761; x=1711040761;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=MgiqpHKxp/iCbsM0LUs1CNRLARbXLFKM0eI7lPgT7Xs=;
  b=JGhIrtXPVZdsuQEDi6rGNYqlgjr7rrwPpJUNM79CZHp5fqP4bnBM5V1k
   oaA9sCHUYmE2Mr4TpkugBskhTtT0Q38wa2D6iUGVE0iV+JyqzzdIOUlmN
   or2rCKs/jmPQzh/eSuh0pIZHAW02rbR4olYQdpdMgHQ8hbMd6WNWITV7Q
   7RVgz0Yc2BT8Wxa/1FYoYI340cjyeMo8kxGnpOpv3vYBy1uLrp1Cc2KrY
   wUpR65m/oiehs+itYBwdm88Fb9cNjNYXuxRtV1DoEBFexffOSmkVsuMmQ
   4z40u2mfOdkEQAxiqxgx1wa0M4mXofhcYp8Hju/Cu/rN5aq2/wwtnpGhD
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="336780795"
X-IronPort-AV: E=Sophos;i="5.98,282,1673942400"; 
   d="scan'208";a="336780795"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2023 10:05:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="805900791"
X-IronPort-AV: E=Sophos;i="5.98,282,1673942400"; 
   d="scan'208";a="805900791"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 22 Mar 2023 10:05:47 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pf1uE-000DVq-2p;
	Wed, 22 Mar 2023 17:05:46 +0000
Date: Thu, 23 Mar 2023 01:05:26 +0800
From: kernel test robot <lkp@intel.com>
To: Naresh Solanki <naresh.solanki@9elements.com>,
	Lee Jones <lee@kernel.org>, Pavel Machek <pavel@ucw.cz>
Cc: oe-kbuild-all@lists.linux.dev,
	Patrick Rudolph <patrick.rudolph@9elements.com>,
	Naresh Solanki <Naresh.Solanki@9elements.com>,
	linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
Subject: Re: [PATCH 2/2] leds: max597x: Add support for max597x
Message-ID: <202303230037.O7fPpT2X-lkp@intel.com>
References: <20230322124316.2147143-2-Naresh.Solanki@9elements.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230322124316.2147143-2-Naresh.Solanki@9elements.com>

Hi Naresh,

I love your patch! Perhaps something to improve:

[auto build test WARNING on 368eb79f738a21e16c2bdbcac2444dfa96b01aaa]

url:    https://github.com/intel-lab-lkp/linux/commits/Naresh-Solanki/leds-max597x-Add-support-for-max597x/20230322-204408
base:   368eb79f738a21e16c2bdbcac2444dfa96b01aaa
patch link:    https://lore.kernel.org/r/20230322124316.2147143-2-Naresh.Solanki%409elements.com
patch subject: [PATCH 2/2] leds: max597x: Add support for max597x
reproduce:
        make versioncheck

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303230037.O7fPpT2X-lkp@intel.com/

versioncheck warnings: (new ones prefixed by >>)
   INFO PATH=/opt/cross/clang/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 3h /usr/bin/make W=1 --keep-going HOSTCC=gcc-11 CC=gcc-11 -j32 ARCH=x86_64 versioncheck
   find ./* \( -name SCCS -o -name BitKeeper -o -name .svn -o -name CVS -o -name .pc -o -name .hg -o -name .git \) -prune -o \
   	-name '*.[hcS]' -type f -print | sort \
   	| xargs perl -w ./scripts/checkversion.pl
   ./drivers/accessibility/speakup/genmap.c: 13 linux/version.h not needed.
   ./drivers/accessibility/speakup/makemapdata.c: 13 linux/version.h not needed.
   ./drivers/iio/adc/max597x-iio.c: 20 linux/version.h not needed.
>> ./drivers/leds/leds-max597x.c: 20 linux/version.h not needed.
   ./drivers/net/ethernet/qlogic/qede/qede.h: 10 linux/version.h not needed.
   ./drivers/net/ethernet/qlogic/qede/qede_ethtool.c: 7 linux/version.h not needed.
   ./drivers/soc/tegra/cbb/tegra-cbb.c: 19 linux/version.h not needed.
   ./drivers/soc/tegra/cbb/tegra194-cbb.c: 26 linux/version.h not needed.
   ./drivers/soc/tegra/cbb/tegra234-cbb.c: 27 linux/version.h not needed.
   ./drivers/staging/media/atomisp/include/linux/atomisp.h: 23 linux/version.h not needed.
   ./samples/trace_events/trace_custom_sched.c: 11 linux/version.h not needed.
   ./sound/soc/codecs/cs42l42.c: 14 linux/version.h not needed.
   ./tools/lib/bpf/bpf_helpers.h: 289: need linux/version.h
   ./tools/perf/tests/bpf-script-example.c: 60: need linux/version.h
   ./tools/perf/tests/bpf-script-test-kbuild.c: 21: need linux/version.h
   ./tools/perf/tests/bpf-script-test-prologue.c: 49: need linux/version.h
   ./tools/perf/tests/bpf-script-test-relocation.c: 51: need linux/version.h
   ./tools/testing/selftests/bpf/progs/dev_cgroup.c: 9 linux/version.h not needed.
   ./tools/testing/selftests/bpf/progs/netcnt_prog.c: 3 linux/version.h not needed.
   ./tools/testing/selftests/bpf/progs/test_map_lock.c: 4 linux/version.h not needed.
   ./tools/testing/selftests/bpf/progs/test_send_signal_kern.c: 4 linux/version.h not needed.
   ./tools/testing/selftests/bpf/progs/test_spin_lock.c: 4 linux/version.h not needed.
   ./tools/testing/selftests/bpf/progs/test_tcp_estats.c: 37 linux/version.h not needed.
   ./tools/testing/selftests/wireguard/qemu/init.c: 27 linux/version.h not needed.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
