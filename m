Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794019226;
	b=n5KpQhg3iASwclrLMszLg1RjO5hlk3xImHVFksswWbGp/K6VswB5YCtb0tPZ8Ju7v90P
	 suxYuHDEkDevZYyfZJ2XX1N066lvI9RqGaDQEyrFT1BRaQg6ao8fTk7E/nPmcJWJrO5On
	 6f5KIw4StpPj4DP8pkX3ZhcoKYaT6zno+QNuCsb4AmdY9zsPQijAppvHyMXKDHOeKYRNb
	 AEWPNpgIWEBS4kJBvTpdrk2mVEZG0nMLcZZV2QE7LTU6slTsep08p26zE4RFBz7G7c5lG
	 J401ympuiqXbmix0EleBKnH5L/RJktfLCBl4b6jZFbFSgNrqvJy0MIELPHoKCk5y5GQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794019226;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=5yIaA1bzP6vzrjVIIqC7p1sPnkU4MSCiaQ+GY83wLX0=;
	b=UVt+8gyVIrFFYwO/wAsR2VU1rCwWFJi23XEp/fIQOF2y7tlSceDvXMdV5wihmSMrftac
	 J+mtQqlHUgya8la4X4wbSVVwvjlas+eESzJAFJu3mIHDXZRVAx8CIUd/oS9OljRwTPdkS
	 4AM3n/IwimiQcEnfTV4ysKYPTFu1IAp+B3iQSsmjnvAyDIy4kG3u3f7HldtAaA57o8Hud
	 Q3fkwUuVPou1DkZgp8eowsXYmex9e8XPIJMDiCE/z5sUE+kEaKQ4oH01ML4Qfw6qmlARh
	 4EbV+mCOgeyeKpu94plqG5BrEeMA3USJegTgQX09xVoAzErGGfVlJef8fkIx6OEG3YA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Ig8FvDVG;
	arc=none smtp.remote-ip=192.198.163.9
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 262D0606A33E
	for <oe-kbuild-all@lists.linux.dev>; Sat,  7 Nov 2026 02:40:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 262D0606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Ig8FvDVG
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794019223; x=1825555223;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=xMU/hY+oTElnrgatj7FPLoBYdvAW0FdMzT26d1hJKME=;
  b=Ig8FvDVGdEUlfh5WjONY/zBadpNWxDXYNvqzyWt/e75fZ+p74pbL5iV0
   ruE73uUuZOQQdbcIWsbfhLDx30NOxmd7CSt99Io6DMnGI8Kz+0BXLS9F+
   hRIQm3oqzAIqhdACSNmnKSFs1xOYN4qSqNNM5p0B9H5dtXhxP2RregaVX
   /SIBc4QSwrqgq6Oq8GUPp3Q5xBwQjGogMWVoOg/UCR5k1NxwcUWCxSu26
   tsk18uCL33soDPg7WINTUnPTHCogrkCocoLfYHXAKNIJnM3qS08In0QCq
   x97rvYLLNLr+Y2NmXVwNDCYaFbuosMESxGAkUpmeEwwMZ7jxomhtA8ceu
   A==;
X-CSE-ConnectionGUID: uzJKifB/SXKsH6/62v80oQ==
X-CSE-MsgGUID: It7CTnfnRVKzHPFcsD49ww==
X-IronPort-AV: E=McAfee;i="6800,10657,11958"; a="2717601"
X-IronPort-AV: E=Sophos;i="6.27,199,1787036400"; 
   d="scan'208";a="2717601"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2026 18:40:22 -0800
X-CSE-ConnectionGUID: B6ihNmJGQrub7i0eg50QzQ==
X-CSE-MsgGUID: tU+SfGi3TUm8mXL05Fl3QA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,199,1787036400"; 
   d="scan'208";a="7771066"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 06 Nov 2026 18:40:21 -0800
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xPWLq-00000000AW3-2hGb;
	Sat, 07 Nov 2026 02:40:18 +0000
Date: Sat, 07 Nov 2026 03:39:19 +0100
From: kernel test robot <lkp@intel.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org
Subject: [bigeasy-staging:sched_dl 1/4] htmldocs: Warning:
 Documentation/translations/sp_SP/scheduler/sched-bwc.rst references a file
 that doesn't exist: Documentation/scheduler/sched-rt-group.rst
Message-ID: <202611070348.Lje0UJJV-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bigeasy/staging.git=
 sched_dl
head:   048bd4cd9d9a4bd96eb2ae73b86474abd9bed12e
commit: 6b87810731941de437ede9e1c6a6d894ea843cdf [1/4] sched: Remove CONFIG=
_RT_GROUP_SCHED
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933=
e47d3a3451d81e72ac174dcb5aa28b59d1)
docutils: docutils (Docutils 0.23, Python 3.13.5, on linux)
sphinx: sphinx-build 9.2.0
reproduce: (https://download.01.org/0day-ci/archive/20261107/202611070348.L=
je0UJJV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611070348.Lje0UJJV-lkp@i=
ntel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/devicetree/bindings/regulator/siliconmitus,sm5703=
-regulator.yaml references a file that doesn't exist: Documentation/devicet=
ree/bindings/mfd/siliconmitus,sm5703.yaml
   Warning: Documentation/translations/it_IT/doc-guide/parse-headers.rst re=
ferences a file that doesn't exist: Documentation/userspace-api/media/Makef=
ile
   Warning: Documentation/translations/ja_JP/SubmittingPatches references a=
 file that doesn't exist: linux-2.6.12-vanilla/Documentation/dontdiff
   Warning: Documentation/translations/ja_JP/process/submit-checklist.rst r=
eferences a file that doesn't exist: Documentation/translations/ja_JP/Submi=
tChecklist
>> Warning: Documentation/translations/sp_SP/scheduler/sched-bwc.rst refere=
nces a file that doesn't exist: Documentation/scheduler/sched-rt-group.rst
   Warning: Documentation/translations/zh_CN/doc-guide/parse-headers.rst re=
ferences a file that doesn't exist: Documentation/userspace-api/media/Makef=
ile
   Warning: Documentation/translations/zh_CN/filesystems/gfs2-glocks.rst re=
ferences a file that doesn't exist: Documentation/filesystems/gfs2-glocks.r=
st
   Warning: Documentation/translations/zh_CN/filesystems/gfs2-uevents.rst r=
eferences a file that doesn't exist: Documentation/filesystems/gfs2-uevents=
.rst
   Warning: Documentation/translations/zh_CN/filesystems/gfs2.rst reference=
s a file that doesn't exist: Documentation/filesystems/gfs2.rst
   Warning: Documentation/translations/zh_CN/how-to.rst references a file t=
hat doesn't exist: Documentation/xxx/xxx.rst
   Warning: Documentation/translations/zh_CN/how-to.rst references a file t=
hat doesn't exist: Documentation/translations/zh_CN/xxx.rst
   Warning: Documentation/translations/zh_CN/networking/xfrm_proc.rst refer=
ences a file that doesn't exist: Documentation/networking/xfrm_proc.rst
>> Warning: Documentation/translations/zh_CN/scheduler/sched-bwc.rst refere=
nces a file that doesn't exist: SCHED_RT=E7=9A=84=E6=83=85=E5=86=B5=E5=9C=
=A8Documentation/scheduler/sched-rt-group.rst
   Warning: Documentation/translations/zh_CN/scsi/scsi_mid_low_api.rst refe=
rences a file that doesn't exist: Documentation/Configure.help
   Warning: MAINTAINERS references a file that doesn't exist: Documentation=
/devicetree/bindings/display/bridge/megachips-stdpxxxx-ge-b850v3-fw.txt
   Warning: arch/arm/xen/enlighten.c references a file that doesn't exist: =
Documentation/devicetree/bindings/arm/xen.txt
   Warning: arch/powerpc/sysdev/mpic.c references a file that doesn't exist=
: Documentation/devicetree/bindings/powerpc/fsl/mpic.txt
   Warning: rust/kernel/sync/atomic/ordering.rs references a file that does=
n't exist: srctree/tools/memory-model/Documentation/explanation.txt

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
