Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D74DFBEA
	for <oe-kbuild-all@lists.linux.dev>; Sun, 18 Feb 2024 16:26:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708273606; cv=none; b=XrSYk6RvfMy1n0LEdMA7nid0WiICyLQH0c7F+ogi6fzZmvpXVTrlE8o3bJpUm3wfbx1nH6BwBWZnkXUicv8R+XHDbe39MM2lV8xQuu93LZTOxvoOXqdfjqTm6uP9STt/Qzy4ofumAkG5VF4NtCBkI3efY0cmvAkdjEY7UaA9KeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708273606; c=relaxed/simple;
	bh=ZWrIkzHk4owkeRa/p8ae5PgZD40hniyhDAAdLX56BZM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RYGGCBUcplr9DId9QPxOOyDt8mDDv7xjiBs8WdimPI0oWG88ovCLYZDHZZKaoQTVhdAxunFAs/UDR8wpxKOai2TlqcSYQ2GEVdtqvnuulzSVp4JhSDZcqBZ0jdKj9lB39V49Ao49W14qbJ1rcaPWA0GOeUrJwARPy0YkYzL6xHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a147nVlB; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a147nVlB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708273605; x=1739809605;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZWrIkzHk4owkeRa/p8ae5PgZD40hniyhDAAdLX56BZM=;
  b=a147nVlBxa4CCC3iAot+6AZzGvebKygTfvb0W7k8OA8Gr61UQ8SUEj92
   SpgEnXDc8XRvWgarqvm/1VPS7TyKJIwjy+gMNcxeiw7Ftx93MlKJlmIip
   I1hW3gj/wLaqqt1EJpt76CMZ6zk+o9BjuSbxAK2k7Rq1Ax70XA08+UKlD
   xFAyId9PrGAiVVK+9OndZIWxDb5LoxjuYuORG5L5OAqKFted5cihkXiTs
   9tnAO+hNUlG8Z5iLej6RbPiNnXb2KpcV0jmV9JV7eCKj2LZcrVrlzOtqa
   HDOprkyQ1hkQ/cJqeWkiBcH/ylrbNMrr8+8ELTp5kVSZ4SeMx6CuwNWCR
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10988"; a="2213547"
X-IronPort-AV: E=Sophos;i="6.06,168,1705392000"; 
   d="scan'208";a="2213547"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2024 08:26:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,168,1705392000"; 
   d="scan'208";a="8899958"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 18 Feb 2024 08:26:37 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rbjzu-00039L-2x;
	Sun, 18 Feb 2024 16:26:34 +0000
Date: Mon, 19 Feb 2024 00:26:14 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>,
	Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Kalle Valo <kvalo@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Bjorn Helgaas <helgaas@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Arnd Bergmann <arnd@arndb.de>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Alex Elder <elder@linaro.org>,
	Srini Kandagatla <srinivas.kandagatla@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Abel Vesa <abel.vesa@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Lukas Wunner <lukas@wunner.de>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v5 15/18] power: sequencing: implement the pwrseq core
Message-ID: <202402190044.IvcTQ7Xv-lkp@intel.com>
References: <20240216203215.40870-16-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240216203215.40870-16-brgl@bgdev.pl>

Hi Bartosz,

kernel test robot noticed the following build warnings:

[auto build test WARNING on next-20240216]
[cannot apply to pci/next pci/for-linus robh/for-next bluetooth/master linus/master v6.8-rc4 v6.8-rc3 v6.8-rc2 v6.8-rc4]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Bartosz-Golaszewski/of-Add-cleanup-h-based-auto-release-via-__free-device_node-markings/20240217-044313
base:   next-20240216
patch link:    https://lore.kernel.org/r/20240216203215.40870-16-brgl%40bgdev.pl
patch subject: [PATCH v5 15/18] power: sequencing: implement the pwrseq core
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240219/202402190044.IvcTQ7Xv-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240219/202402190044.IvcTQ7Xv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402190044.IvcTQ7Xv-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/power/sequencing/core.c:573: warning: expecting prototype for pwrseq_device_get_data(). Prototype was for pwrseq_device_get_drvdata() instead


vim +573 drivers/power/sequencing/core.c

   563	
   564	/**
   565	 * pwrseq_device_get_data() - Get the driver private data associated with this
   566	 *                            sequencer.
   567	 * @pwrseq: Power sequencer object.
   568	 *
   569	 * Returns:
   570	 * Address of the private driver data.
   571	 */
   572	void *pwrseq_device_get_drvdata(struct pwrseq_device *pwrseq)
 > 573	{
   574		return dev_get_drvdata(&pwrseq->dev);
   575	}
   576	EXPORT_SYMBOL_GPL(pwrseq_device_get_drvdata);
   577	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
