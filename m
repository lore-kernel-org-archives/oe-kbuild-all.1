Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9CDE17CE
	for <oe-kbuild-all@lists.linux.dev>; Sun,  7 May 2023 12:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683463234; x=1714999234;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=w+KB+IjoGYtnIEgjAFqDGRRf9XgrfvXlJ1idBPDUWoY=;
  b=U3IcV2ciPr5FDg4XOe+DzudShvJ/rfUAZRFY4NWB4j394D7Uz2kktx88
   fmWXYpJOzZkKji8kmCw2SPu4Pv1PSpyRRxTrOKuN3NfEvQDCVPc+eCpc7
   dKNS1/OB8d7Slo61aAymyEUmK2qvSxt7sJRK5fnhKf7ABj+pJmpusHFeE
   0504jQTMv5lvpyf+hNL0TpCWEkgttre0J54mV1kM2gRcsRwvGa5zfHpYK
   yzfa7No3c/SgT8adUx6qlfZds8DAfkW8NZ5FCkGM1jgRJhO9itoFu1qHJ
   xBVLFsmPNMlQ3Q6hzRNDXIDo1N/kOF5Piv9RY3be8rZoP2vEq6cVw/Ctx
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10702"; a="349509599"
X-IronPort-AV: E=Sophos;i="5.99,257,1677571200"; 
   d="scan'208";a="349509599"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2023 05:40:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10702"; a="787794904"
X-IronPort-AV: E=Sophos;i="5.99,257,1677571200"; 
   d="scan'208";a="787794904"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 07 May 2023 05:40:33 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pvdgm-0000kX-0g;
	Sun, 07 May 2023 12:40:32 +0000
Date: Sun, 7 May 2023 20:40:30 +0800
From: kernel test robot <lkp@intel.com>
To: Geraldo Nascimento <geraldogabriel@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Sasha Levin <sashal@kernel.org>,
	Takashi Iwai <tiwai@suse.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [linux-stable-rc:queue/5.10 53/276]
 sound/usb/quirks-table.h:3705:42: error: 'const struct audioformat' has no
 member named 'ep_idx'
Message-ID: <202305072033.4PR7b9pO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git queue/5.10
head:   f8164a532fe55e12af2fa67df10ec123b486288f
commit: df32d31b64db81cd5c50edb12b6f165757f0ade7 [53/276] ALSA: usb-audio: Add quirk for Pioneer DDJ-800
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20230507/202305072033.4PR7b9pO-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git/commit/?id=df32d31b64db81cd5c50edb12b6f165757f0ade7
        git remote add linux-stable-rc https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git
        git fetch --no-tags linux-stable-rc queue/5.10
        git checkout df32d31b64db81cd5c50edb12b6f165757f0ade7
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sh olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sh SHELL=/bin/bash M=sound/usb

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305072033.4PR7b9pO-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from sound/usb/card.c:1090:
>> sound/usb/quirks-table.h:3705:42: error: 'const struct audioformat' has no member named 'ep_idx'
    3705 |                                         .ep_idx = 1,
         |                                          ^~~~~~
   In file included from include/linux/usb/ch9.h:37,
                    from include/linux/usb.h:6,
                    from sound/usb/card.c:29:
   include/uapi/linux/usb/ch9.h:434:41: warning: initialized field overwritten [-Woverride-init]
     434 | #define USB_ENDPOINT_XFER_ISOC          1
         |                                         ^
   sound/usb/quirks-table.h:3706:52: note: in expansion of macro 'USB_ENDPOINT_XFER_ISOC'
    3706 |                                         .ep_attr = USB_ENDPOINT_XFER_ISOC|
         |                                                    ^~~~~~~~~~~~~~~~~~~~~~
   include/uapi/linux/usb/ch9.h:434:41: note: (near initialization for '(anonymous).ep_attr')
     434 | #define USB_ENDPOINT_XFER_ISOC          1
         |                                         ^
   sound/usb/quirks-table.h:3706:52: note: in expansion of macro 'USB_ENDPOINT_XFER_ISOC'
    3706 |                                         .ep_attr = USB_ENDPOINT_XFER_ISOC|
         |                                                    ^~~~~~~~~~~~~~~~~~~~~~


vim +3705 sound/usb/quirks-table.h

  3664	
  3665	{
  3666		/*
  3667		 * PIONEER DJ DDJ-800
  3668		 * PCM is 6 channels out, 6 channels in @ 44.1 fixed
  3669		 * The Feedback for the output is the input
  3670		 */
  3671		USB_DEVICE_VENDOR_SPEC(0x2b73, 0x0029),
  3672			.driver_info = (unsigned long) &(const struct snd_usb_audio_quirk) {
  3673			.ifnum = QUIRK_ANY_INTERFACE,
  3674			.type = QUIRK_COMPOSITE,
  3675			.data = (const struct snd_usb_audio_quirk[]) {
  3676				{
  3677					.ifnum = 0,
  3678					.type = QUIRK_AUDIO_FIXED_ENDPOINT,
  3679					.data = &(const struct audioformat) {
  3680						.formats = SNDRV_PCM_FMTBIT_S24_3LE,
  3681						.channels = 6,
  3682						.iface = 0,
  3683						.altsetting = 1,
  3684						.altset_idx = 1,
  3685						.endpoint = 0x01,
  3686						.ep_attr = USB_ENDPOINT_XFER_ISOC|
  3687							USB_ENDPOINT_SYNC_ASYNC,
  3688						.rates = SNDRV_PCM_RATE_44100,
  3689						.rate_min = 44100,
  3690						.rate_max = 44100,
  3691						.nr_rates = 1,
  3692						.rate_table = (unsigned int[]) { 44100 }
  3693					}
  3694				},
  3695				{
  3696					.ifnum = 0,
  3697					.type = QUIRK_AUDIO_FIXED_ENDPOINT,
  3698					.data = &(const struct audioformat) {
  3699						.formats = SNDRV_PCM_FMTBIT_S24_3LE,
  3700						.channels = 6,
  3701						.iface = 0,
  3702						.altsetting = 1,
  3703						.altset_idx = 1,
  3704						.endpoint = 0x82,
> 3705						.ep_idx = 1,
  3706						.ep_attr = USB_ENDPOINT_XFER_ISOC|
  3707							USB_ENDPOINT_SYNC_ASYNC|
  3708						USB_ENDPOINT_USAGE_IMPLICIT_FB,
  3709						.rates = SNDRV_PCM_RATE_44100,
  3710						.rate_min = 44100,
  3711						.rate_max = 44100,
  3712						.nr_rates = 1,
  3713						.rate_table = (unsigned int[]) { 44100 }
  3714					}
  3715				},
  3716				{
  3717					.ifnum = -1
  3718				}
  3719			}
  3720		}
  3721	},
  3722	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
