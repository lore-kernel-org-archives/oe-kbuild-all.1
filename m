Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E34457F
	for <oe-kbuild-all@lists.linux.dev>; Sat, 22 Apr 2023 05:10:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682140237; x=1713676237;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NZ7Yi5Ba3B+iKMiWzdo2aP5IwknTryrQsZsF15CcN/I=;
  b=FKZi9miBrYGUAxVnZdu3jlUez7TyYh5jO1xx6OJ3eX2IQMVwLGMkuu3D
   ob8UrqXIEum8r/Sa3HbIlBTR1r+y0rw0AnjsaF1SVkgLqoYmPlkMhvs1k
   I6j3OOjA6LCEGpfGfHsUeGcfzCQvS1RlStespeznkp9i1Hxf9CmuBQTf2
   NDmUJqilBcWR+40YtPEBcQHt6MsfhcdegH6vicb4fT8kKKeMUS1qput7g
   YOhMHXldtuf/kspRNCUCqCOwf6ZG7rSrlzkEk4eRdAvr0ss7I0dKhV2RF
   oI/z1qXAw2uN8c5ZOEylvT3FymGLJJ3MHaEXMQvzkV7ELvF0mCmDEjr2y
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10687"; a="325724905"
X-IronPort-AV: E=Sophos;i="5.99,216,1677571200"; 
   d="scan'208";a="325724905"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2023 22:10:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10687"; a="781814869"
X-IronPort-AV: E=Sophos;i="5.99,216,1677571200"; 
   d="scan'208";a="781814869"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 21 Apr 2023 22:10:36 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pq5W7-000h5Y-0y;
	Sat, 22 Apr 2023 05:10:35 +0000
Date: Sat, 22 Apr 2023 13:10:04 +0800
From: kernel test robot <lkp@intel.com>
To: "Kernel Builder (sita)" <ubuntu-kernel-bot@canonical.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jarkko-tpmdd:tis-irq 1/81]
 debian/certs/canonical-livepatch-all.pem: warning: ignored by one of the
 .gitignore files
Message-ID: <202304221318.dPbqQfb4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git tis-irq
head:   6cea73a6f10e7c9d07f77bb894d6aa4a29ed7bd8
commit: b501f0776b8b71c618403e34735f9742a29f7057 [1/81] base packaging
config: i386-randconfig-a001 (https://download.01.org/0day-ci/archive/20230422/202304221318.dPbqQfb4-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git/commit/?id=b501f0776b8b71c618403e34735f9742a29f7057
        git remote add jarkko-tpmdd git://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git
        git fetch --no-tags jarkko-tpmdd tis-irq
        git checkout b501f0776b8b71c618403e34735f9742a29f7057
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304221318.dPbqQfb4-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> debian/certs/canonical-livepatch-all.pem: warning: ignored by one of the .gitignore files
>> debian/certs/ubuntu-drivers-all.pem: warning: ignored by one of the .gitignore files
>> debian/cloud-tools/hv_get_dhcp_info: warning: ignored by one of the .gitignore files
>> debian/cloud-tools/hv_get_dns_info: warning: ignored by one of the .gitignore files
>> debian/cloud-tools/hv_set_ifconfig: warning: ignored by one of the .gitignore files
>> debian/commit-templates/bumpabi: warning: ignored by one of the .gitignore files
>> debian/commit-templates/config-updates: warning: ignored by one of the .gitignore files
>> debian/commit-templates/external-driver: warning: ignored by one of the .gitignore files
>> debian/commit-templates/missing-modules: warning: ignored by one of the .gitignore files
>> debian/commit-templates/newrelease: warning: ignored by one of the .gitignore files
>> debian/commit-templates/sauce-patch: warning: ignored by one of the .gitignore files
>> debian/commit-templates/upstream-patch: warning: ignored by one of the .gitignore files
>> debian/control.d/flavour-buildinfo.stub: warning: ignored by one of the .gitignore files
>> debian/control.d/flavour-module.stub: warning: ignored by one of the .gitignore files
>> debian/debian.env: warning: ignored by one of the .gitignore files
>> debian/dkms-versions: warning: ignored by one of the .gitignore files
>> debian/docs/README.inclusion-list: warning: ignored by one of the .gitignore files
>> debian/gbp.conf: warning: ignored by one of the .gitignore files
>> debian/linux-cloud-tools-common.hv-fcopy-daemon.service: warning: ignored by one of the .gitignore files
>> debian/linux-cloud-tools-common.hv-fcopy-daemon.udev: warning: ignored by one of the .gitignore files
   debian/linux-cloud-tools-common.hv-fcopy-daemon.upstart: warning: ignored by one of the .gitignore files
   debian/linux-cloud-tools-common.hv-kvp-daemon.service: warning: ignored by one of the .gitignore files
   debian/linux-cloud-tools-common.hv-kvp-daemon.udev: warning: ignored by one of the .gitignore files
   debian/linux-cloud-tools-common.hv-kvp-daemon.upstart: warning: ignored by one of the .gitignore files
   debian/linux-cloud-tools-common.hv-vss-daemon.service: warning: ignored by one of the .gitignore files
   debian/linux-cloud-tools-common.hv-vss-daemon.udev: warning: ignored by one of the .gitignore files
   debian/linux-cloud-tools-common.hv-vss-daemon.upstart: warning: ignored by one of the .gitignore files
   debian/linux-cloud-tools-common.intel-sgx-load-module.service: warning: ignored by one of the .gitignore files
   debian/revoked-certs/canonical-uefi-2012-all.pem: warning: ignored by one of the .gitignore files
   debian/revoked-certs/canonical-uefi-2017-all.pem: warning: ignored by one of the .gitignore files
   debian/revoked-certs/canonical-uefi-2018-all.pem: warning: ignored by one of the .gitignore files
   debian/revoked-certs/canonical-uefi-2019-all.pem: warning: ignored by one of the .gitignore files
   debian/revoked-certs/canonical-uefi-2021v1-all.pem: warning: ignored by one of the .gitignore files
   debian/revoked-certs/canonical-uefi-2021v2-all.pem: warning: ignored by one of the .gitignore files
   debian/revoked-certs/canonical-uefi-2021v3-all.pem: warning: ignored by one of the .gitignore files
   debian/revoked-certs/canonical-uefi-uc2019-all.pem: warning: ignored by one of the .gitignore files
   debian/rules: warning: ignored by one of the .gitignore files
   debian/rules.d/0-common-vars.mk: warning: ignored by one of the .gitignore files
   debian/rules.d/1-maintainer.mk: warning: ignored by one of the .gitignore files
   debian/rules.d/2-binary-arch.mk: warning: ignored by one of the .gitignore files
   debian/rules.d/3-binary-indep.mk: warning: ignored by one of the .gitignore files
   debian/rules.d/4-checks.mk: warning: ignored by one of the .gitignore files
   debian/scripts/checks/abi-check: warning: ignored by one of the .gitignore files
   debian/scripts/checks/config-check: warning: ignored by one of the .gitignore files
   debian/scripts/checks/module-check: warning: ignored by one of the .gitignore files
   debian/scripts/checks/module-signature-check: warning: ignored by one of the .gitignore files
   debian/scripts/checks/retpoline-check: warning: ignored by one of the .gitignore files
   debian/scripts/control-create: warning: ignored by one of the .gitignore files
   debian/scripts/dkms-build: warning: ignored by one of the .gitignore files
   debian/scripts/dkms-build--nvidia-N: warning: ignored by one of the .gitignore files
   debian/scripts/dkms-build-configure--zfs: warning: ignored by one of the .gitignore files
   debian/scripts/file-downloader: warning: ignored by one of the .gitignore files
   debian/scripts/fix-filenames.c: warning: ignored by one of the .gitignore files
   debian/scripts/helpers/close: warning: ignored by one of the .gitignore files
   debian/scripts/helpers/open: warning: ignored by one of the .gitignore files
   debian/scripts/helpers/rebase: warning: ignored by one of the .gitignore files
   debian/scripts/link-headers: warning: ignored by one of the .gitignore files
   debian/scripts/misc/annotations: warning: ignored by one of the .gitignore files
   debian/scripts/misc/arch-has-odm-enabled.sh: warning: ignored by one of the .gitignore files
   debian/scripts/misc/final-checks: warning: ignored by one of the .gitignore files
   debian/scripts/misc/find-missing-sauce.sh: warning: ignored by one of the .gitignore files
   debian/scripts/misc/fw-to-ihex.sh: warning: ignored by one of the .gitignore files
   debian/scripts/misc/gen-auto-reconstruct: warning: ignored by one of the .gitignore files
   debian/scripts/misc/getabis: warning: ignored by one of the .gitignore files
   debian/scripts/misc/git-ubuntu-log: warning: ignored by one of the .gitignore files
   debian/scripts/misc/insert-changes: warning: ignored by one of the .gitignore files
   debian/scripts/misc/insert-mainline-changes: warning: ignored by one of the .gitignore files
   debian/scripts/misc/insert-ubuntu-changes: warning: ignored by one of the .gitignore files
   debian/scripts/misc/kconfig/__init__.py: warning: ignored by one of the .gitignore files
   debian/scripts/misc/kconfig/annotations.py: warning: ignored by one of the .gitignore files
   debian/scripts/misc/kernelconfig: warning: ignored by one of the .gitignore files
   debian/scripts/misc/migrate-annotations: warning: ignored by one of the .gitignore files
   debian/scripts/misc/old-kernelconfig: warning: ignored by one of the .gitignore files
   debian/scripts/misc/retag: warning: ignored by one of the .gitignore files
   debian/scripts/misc/splitconfig.pl: warning: ignored by one of the .gitignore files
   debian/scripts/misc/update-aufs.sh: warning: ignored by one of the .gitignore files
   debian/scripts/module-inclusion: warning: ignored by one of the .gitignore files
   debian/scripts/retpoline-extract: warning: ignored by one of the .gitignore files
   debian/scripts/retpoline-extract-one: warning: ignored by one of the .gitignore files
   debian/scripts/sign-module: warning: ignored by one of the .gitignore files
   debian/scripts/sub-flavour: warning: ignored by one of the .gitignore files
   debian/signature-inclusion: warning: ignored by one of the .gitignore files
   debian/snapcraft.mk: warning: ignored by one of the .gitignore files
   debian/source/format: warning: ignored by one of the .gitignore files
   debian/source/options: warning: ignored by one of the .gitignore files
   debian/stamps/keep-dir: warning: ignored by one of the .gitignore files
   debian/templates/extra.postinst.in: warning: ignored by one of the .gitignore files
   debian/templates/extra.postrm.in: warning: ignored by one of the .gitignore files
   debian/templates/headers.postinst.in: warning: ignored by one of the .gitignore files
   debian/templates/image.postinst.in: warning: ignored by one of the .gitignore files
   debian/templates/image.postrm.in: warning: ignored by one of the .gitignore files
   debian/templates/image.preinst.in: warning: ignored by one of the .gitignore files
   debian/templates/image.prerm.in: warning: ignored by one of the .gitignore files
   debian/tests-build/README: warning: ignored by one of the .gitignore files
   debian/tests-build/check-aliases: warning: ignored by one of the .gitignore files
   debian/tests/control: warning: ignored by one of the .gitignore files
   debian/tests/rebuild: warning: ignored by one of the .gitignore files
   debian/tests/ubuntu-regression-suite: warning: ignored by one of the .gitignore files
   debian/tools/generic: warning: ignored by one of the .gitignore files
   debian/v4l2loopback-modules.ignore: warning: ignored by one of the .gitignore files
   debian/wireguard-modules.ignore: warning: ignored by one of the .gitignore files
   debian/zfs-modules.ignore: warning: ignored by one of the .gitignore files
   drivers/clk/.kunitconfig: warning: ignored by one of the .gitignore files
   drivers/gpu/drm/tests/.kunitconfig: warning: ignored by one of the .gitignore files
   drivers/gpu/drm/vc4/tests/.kunitconfig: warning: ignored by one of the .gitignore files
   drivers/hid/.kunitconfig: warning: ignored by one of the .gitignore files
   fs/ext4/.kunitconfig: warning: ignored by one of the .gitignore files
   fs/fat/.kunitconfig: warning: ignored by one of the .gitignore files
   kernel/kcsan/.kunitconfig: warning: ignored by one of the .gitignore files
   lib/kunit/.kunitconfig: warning: ignored by one of the .gitignore files
   mm/kfence/.kunitconfig: warning: ignored by one of the .gitignore files
   net/sunrpc/.kunitconfig: warning: ignored by one of the .gitignore files
   tools/testing/selftests/arm64/tags/.gitignore: warning: ignored by one of the .gitignore files
   tools/testing/selftests/arm64/tags/Makefile: warning: ignored by one of the .gitignore files
   tools/testing/selftests/arm64/tags/run_tags_test.sh: warning: ignored by one of the .gitignore files
   tools/testing/selftests/arm64/tags/tags_test.c: warning: ignored by one of the .gitignore files
   tools/testing/selftests/kvm/.gitignore: warning: ignored by one of the .gitignore files
   tools/testing/selftests/kvm/Makefile: warning: ignored by one of the .gitignore files
   tools/testing/selftests/kvm/config: warning: ignored by one of the .gitignore files
   tools/testing/selftests/kvm/settings: warning: ignored by one of the .gitignore files

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
