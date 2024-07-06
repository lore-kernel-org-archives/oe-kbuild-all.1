Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A13EE20323
	for <oe-kbuild-all@lists.linux.dev>; Sat,  6 Jul 2024 23:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720307125; cv=none; b=DPg4bWgzs5gaX9gnLxVv7Wo9acQAW8OZZoZ4fjLIDnJRVQjAlbtp1taVvmg93ybGCteTX9jIIH7bddbeoUQRaLPRsO4WTK8fQwgv28n2qxaqsLwyg46Z+e1+4ORzBiRctg/3PjxNqlpENOjKNIR3RFPt3p6AP/vpmdZeqji04rQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720307125; c=relaxed/simple;
	bh=04SjTScBVn0ZrO9ZB3vn4HuohMW1iHxZDkEg44AqNuE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GlIVTR2CEzuTHrED9VF3qMrEZHP4gnyWrS/jZJi348QanCpOB3c+m30V6mmzw/X/wcJKv5OAMqKk++6JATuzFU78IoxoCX2K9uUGI5LNB9hLLjveheBnbjq6HX9ZCZFWMBk0l420iCYC60h4kAz4wuIGWRwXsUZrF9pum/UOGLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PUZW8vqv; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PUZW8vqv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720307124; x=1751843124;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=04SjTScBVn0ZrO9ZB3vn4HuohMW1iHxZDkEg44AqNuE=;
  b=PUZW8vqvsW6pf2xAHwgVFgGjrNqmb9ZeVVQ9uwn3UN1O/GTMNNZPr8VN
   4nwFWPUV48pQ7P2leoi/ABLwoBFQHW92PV5QjivCJ2RhOqJ+Z3wZ6/cRJ
   AQkNbiRs3eawPvGIAAn7swF5mTRDNd2LpXkP78i+6MTGceld3cAtdMx8P
   gSSft0ZA+r8SEjnBqnvLVsK8SS5DOx1TycI11ug9vctlkuXtpg8alx+Wz
   6Rc4gpge2a5Pp54ekmEGG+MAd4p1Blxrh1BmFjjYhSVG3ZbaB/0aI3Jpn
   IXSu/o+WJDTotLyP68Vjq6w2TRrYjq+kC9WTEbJSnoIPQOsDYRpfCVvEG
   A==;
X-CSE-ConnectionGUID: im+nOsjiSM+C46YDsAorqA==
X-CSE-MsgGUID: OO+lflplQcu0qpxf8hOCFA==
X-IronPort-AV: E=McAfee;i="6700,10204,11125"; a="28148097"
X-IronPort-AV: E=Sophos;i="6.09,188,1716274800"; 
   d="scan'208";a="28148097"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2024 16:05:23 -0700
X-CSE-ConnectionGUID: a/NGx3ZTRvuAPnRFXgxJCQ==
X-CSE-MsgGUID: UOE72lJkSi+1iHO7f4qP6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,188,1716274800"; 
   d="scan'208";a="47038345"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 06 Jul 2024 16:05:18 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sQESy-000UNW-2m;
	Sat, 06 Jul 2024 23:05:16 +0000
Date: Sun, 7 Jul 2024 07:05:12 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>,
	Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
	Rocky Liao <quic_rjliao@quicinc.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev, netdev@vger.kernel.org,
	linux-bluetooth@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH 2/6] Bluetooth: hci_qca: schedule a devm action for
 disabling the clock
Message-ID: <202407070656.wRERdKMy-lkp@intel.com>
References: <20240705-hci_qca_refactor-v1-2-e2442121c13e@linaro.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240705-hci_qca_refactor-v1-2-e2442121c13e@linaro.org>

Hi Bartosz,

kernel test robot noticed the following build errors:

[auto build test ERROR on 0b58e108042b0ed28a71cd7edf5175999955b233]

url:    https://github.com/intel-lab-lkp/linux/commits/Bartosz-Golaszewski/dt-bindings-bluetooth-qualcomm-describe-the-inputs-from-PMU-for-wcn7850/20240706-055822
base:   0b58e108042b0ed28a71cd7edf5175999955b233
patch link:    https://lore.kernel.org/r/20240705-hci_qca_refactor-v1-2-e2442121c13e%40linaro.org
patch subject: [PATCH 2/6] Bluetooth: hci_qca: schedule a devm action for disabling the clock
config: i386-buildonly-randconfig-006-20240707 (https://download.01.org/0day-ci/archive/20240707/202407070656.wRERdKMy-lkp@intel.com/config)
compiler: gcc-9 (Ubuntu 9.5.0-4ubuntu2) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240707/202407070656.wRERdKMy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407070656.wRERdKMy-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/bluetooth/hci_qca.c: In function 'qca_serdev_remove':
>> drivers/bluetooth/hci_qca.c:2498:2: error: label at end of compound statement
    2498 |  default:
         |  ^~~~~~~


vim +2498 drivers/bluetooth/hci_qca.c

05ba533c5c1155 Thierry Escande                2018-03-29  2478  
05ba533c5c1155 Thierry Escande                2018-03-29  2479  static void qca_serdev_remove(struct serdev_device *serdev)
05ba533c5c1155 Thierry Escande                2018-03-29  2480  {
05ba533c5c1155 Thierry Escande                2018-03-29  2481  	struct qca_serdev *qcadev = serdev_device_get_drvdata(serdev);
054ec5e94a46b0 Venkata Lakshmi Narayana Gubba 2020-09-10  2482  	struct qca_power *power = qcadev->bt_power;
05ba533c5c1155 Thierry Escande                2018-03-29  2483  
691d54d0f7cb14 Neil Armstrong                 2023-08-16  2484  	switch (qcadev->btsoc_type) {
691d54d0f7cb14 Neil Armstrong                 2023-08-16  2485  	case QCA_WCN3988:
691d54d0f7cb14 Neil Armstrong                 2023-08-16  2486  	case QCA_WCN3990:
691d54d0f7cb14 Neil Armstrong                 2023-08-16  2487  	case QCA_WCN3991:
691d54d0f7cb14 Neil Armstrong                 2023-08-16  2488  	case QCA_WCN3998:
691d54d0f7cb14 Neil Armstrong                 2023-08-16  2489  	case QCA_WCN6750:
691d54d0f7cb14 Neil Armstrong                 2023-08-16  2490  	case QCA_WCN6855:
e0c1278ac89b03 Neil Armstrong                 2023-08-16  2491  	case QCA_WCN7850:
691d54d0f7cb14 Neil Armstrong                 2023-08-16  2492  		if (power->vregs_on) {
c2d7827338618a Balakrishna Godavarthi         2018-08-22  2493  			qca_power_shutdown(&qcadev->serdev_hu);
691d54d0f7cb14 Neil Armstrong                 2023-08-16  2494  			break;
691d54d0f7cb14 Neil Armstrong                 2023-08-16  2495  		}
691d54d0f7cb14 Neil Armstrong                 2023-08-16  2496  		fallthrough;
691d54d0f7cb14 Neil Armstrong                 2023-08-16  2497  
691d54d0f7cb14 Neil Armstrong                 2023-08-16 @2498  	default:
691d54d0f7cb14 Neil Armstrong                 2023-08-16  2499  	}
fa9ad876b8e0eb Balakrishna Godavarthi         2018-08-03  2500  
fa9ad876b8e0eb Balakrishna Godavarthi         2018-08-03  2501  	hci_uart_unregister_device(&qcadev->serdev_hu);
05ba533c5c1155 Thierry Escande                2018-03-29  2502  }
05ba533c5c1155 Thierry Escande                2018-03-29  2503  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
