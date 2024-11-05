Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F6CD1D90B4
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Nov 2024 17:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730827317; cv=none; b=MZQXK4xna1sARcqngXDJ6Ku4YqIR9kZYR7oTqnXhGuG3scxmf5/lYZnWseN8oOnWtxvKodUqgcEk6hT+jnO/FoxEQXBQUPOuTHO7hUvQRJ7LR+27Oi7H7kn03WsOl+4mkcCwJtfNT1zwI/NalM1b7lRpP3ArbLa7334K217sl2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730827317; c=relaxed/simple;
	bh=ahMpcYHjaCoJrEVqwl/p5ZYgZE0uGGRlf/qvwZKtOYU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WBxncDJ1rZi1ZAtlOznxsS3vxovKTKJIT0EfWdsNeAXvjwLHqEHjrfS8UrvwJdlmgUElGlvu8w5iS9eUA0akmL0usUOlCPegQ86pDcWBEiyrO26t9IJq6t+PNABuHXawtMDsGZXHYGlKVKQKt5Mj2+l2GTqBcOkMbVuvh9va5yo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JP5ckMmE; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JP5ckMmE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730827316; x=1762363316;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ahMpcYHjaCoJrEVqwl/p5ZYgZE0uGGRlf/qvwZKtOYU=;
  b=JP5ckMmEwoDNA2S/WsMBNXwS0lMvFOhS9vvwNf7D1lzjWYB6J9slr302
   Sftk/B/mlVKiXd4ZVf/fDl1QdEC193knUS44eiPWEAGB3OfjxqMjqh4oD
   bPsV5YlyfXrv0xFKev2AEu84zdB4j+qvh2Y4bVAnweA6LfF7f5zoVo8w8
   JeRMRAry+UbdxTDSOF0HgveOu4O14k/dunaXbCB+5ecBmMIYz/Vvea1um
   C9z86qAcLFLjOl6Gn7n3POAXnAs5ZRcHXohMdQE2kv4301O/ODQ3oVGcc
   Vl5xB6Sk1/5oK+YQuiL1PD3wvKlDoRfq7Ysv+UC0ujxxLAPDOdTUf/p9j
   w==;
X-CSE-ConnectionGUID: ztr1dtpSTYGffpeu/2iRqQ==
X-CSE-MsgGUID: WOiy7YsCR3Sq6hp2Htng4A==
X-IronPort-AV: E=McAfee;i="6700,10204,11247"; a="34374978"
X-IronPort-AV: E=Sophos;i="6.11,260,1725346800"; 
   d="scan'208";a="34374978"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2024 09:21:42 -0800
X-CSE-ConnectionGUID: ptVQYnX9R8K/OpI8CHr8oQ==
X-CSE-MsgGUID: f/BDOr+bQY6kh4vjoiguDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,260,1725346800"; 
   d="scan'208";a="84487945"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 05 Nov 2024 09:21:40 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t8NFJ-000mI0-1r;
	Tue, 05 Nov 2024 17:21:37 +0000
Date: Wed, 6 Nov 2024 01:20:53 +0800
From: kernel test robot <lkp@intel.com>
To: Markus Burri <markus.burri@mt.com>, linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Markus Burri <markus.burri@mt.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Marek Vasut <marek.vasut@gmail.com>, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 3/7] dt-bindings: input: matrix_keypad - convert to
 YAML
Message-ID: <202411060143.8tNHeidk-lkp@intel.com>
References: <20241105130322.213623-4-markus.burri@mt.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241105130322.213623-4-markus.burri@mt.com>

Hi Markus,

kernel test robot noticed the following build warnings:

[auto build test WARNING on dtor-input/for-linus]
[also build test WARNING on robh/for-next linus/master v6.12-rc6 next-20241105]
[cannot apply to dtor-input/next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Markus-Burri/Input-matrix_keypad-use-fsleep-for-variable-delay-duration/20241105-211348
base:   https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git for-linus
patch link:    https://lore.kernel.org/r/20241105130322.213623-4-markus.burri%40mt.com
patch subject: [PATCH v2 3/7] dt-bindings: input: matrix_keypad - convert to YAML
reproduce: (https://download.01.org/0day-ci/archive/20241106/202411060143.8tNHeidk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411060143.8tNHeidk-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: Documentation/devicetree/bindings/power/wakeup-source.txt references a file that doesn't exist: Documentation/devicetree/bindings/input/gpio-matrix-keypad.txt
   Warning: Documentation/devicetree/bindings/power/wakeup-source.txt references a file that doesn't exist: Documentation/devicetree/bindings/input/qcom,pm8xxx-keypad.txt
   Warning: Documentation/devicetree/bindings/regulator/siliconmitus,sm5703-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/siliconmitus,sm5703.yaml
   Warning: Documentation/hwmon/g762.rst references a file that doesn't exist: Documentation/devicetree/bindings/hwmon/g762.txt
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/reserved-memory/qcom
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/display/exynos/

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
