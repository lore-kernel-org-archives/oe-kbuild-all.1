Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A79C1369
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Oct 2023 01:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PMwrk4DG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697419545; x=1728955545;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=seaRZOu6W27CEKE/2vTfInHRC3wjBmrNVt7ZwD/sDoo=;
  b=PMwrk4DGpV+vS8p/zG/OaC2dcCpUOJxsIMXwEf/HMGU72kK/wB5KGTAu
   2zeUEm0QbRYd8QEKj8AN+xews7NS31ezBypsMOr/h1sb2R8WqhDPbPTsJ
   et7160b9dbH6iFzUzRcuN/YalQtSCCoSPMfFC8XSECg7BUwSTYo3Kh/nL
   zZzXYeuWxRXTl+F/4GzxGrYQCcVyNGNNYviYobyNn7YBVimbYtbBYnoBO
   Kufr6fmMRwdAivtYnf9I1Be9A0iNhLlhkJwh0mKHQym8TywXoIg6DPl9n
   6e9YyJEjFx3/vpIDfIgqkZRqvVNR1HVVuZ6GAwA4etQ3XLFYqnhEccKaR
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="370501940"
X-IronPort-AV: E=Sophos;i="6.03,228,1694761200"; 
   d="scan'208";a="370501940"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2023 18:25:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="825811581"
X-IronPort-AV: E=Sophos;i="6.03,228,1694761200"; 
   d="scan'208";a="825811581"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 15 Oct 2023 18:25:36 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qsCMQ-000805-1C;
	Mon, 16 Oct 2023 01:25:34 +0000
Date: Mon, 16 Oct 2023 09:25:31 +0800
From: kernel test robot <lkp@intel.com>
To: Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:sound/speaker-safety 143/206] checkpatch: ERROR:
 trailing whitespace
Message-ID: <202310160914.SFmcPto8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="swt/An/+9Np5tF1G"
Content-Disposition: inline


--swt/An/+9Np5tF1G
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux sound/speaker-safety
head:   c4c1ca0ec7d6b3dcce7304ea88eaaad52f090d90
commit: 4f8d2d369cfca24a6dc75ff7a43cecbcf1ab2204 [143/206] ASoC: macaudio: Tune DT parsing error messages
reproduce:

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310160914.SFmcPto8-lkp@intel.com/

# many are suggestions rather than must-fix

ERROR:TRAILING_WHITESPACE: trailing whitespace
#127: FILE: sound/soc/apple/macaudio.c:373:
+^I^I^I/* $

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

--swt/An/+9Np5tF1G
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=reproduce

reproduce:
        scripts/checkpatch.pl 0001-ASoC-macaudio-Tune-DT-parsing-error-messages.patch

--swt/An/+9Np5tF1G--
