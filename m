Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B731718DF9D
	for <oe-kbuild-all@lists.linux.dev>; Thu, 15 Jan 2026 01:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768441601; cv=none; b=XhdoZajNyobofYgbbwfY0gIdSzuHq/kRwO+3+yUWFqJUfKdehabEglkPg2N5Y6cfKqq8gU2UTvaM6J5LAC9uCd6SrGmsSE8bUB9NzH8MV/UEeos2qq59ouyC2Y0uD6S4W3FGs5yzRD6GsrG1L7TSteVjKo/m6T2cGLwbZ2eXdaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768441601; c=relaxed/simple;
	bh=4I+74DleXBV9Oduis6R/cDkM+cK8FdhRRHYKdpnpmIg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=nSc0EEP2qxdq5tLWgjbMVM2VRWD379hhG9xI4bxCDn+fucs7dkHfDw6QG2dOsiNMzZ+yOq6P1OPRVj4KvycCpAi2LlvB2lLgenQNASBG+JtqExGA3rwAom2+OH2dipDcAqIM1fuFLiobEdbgS9CP5CuUank1pvC1cO9Xx82yQ3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DVHS78cD; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DVHS78cD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768441599; x=1799977599;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=4I+74DleXBV9Oduis6R/cDkM+cK8FdhRRHYKdpnpmIg=;
  b=DVHS78cD4/Cx5Hf0UGsET09ZZ6pXMFPyM5nc1EPZluS7lnPR2qJDEdjk
   K8F5z0DaGP/RqVbhXc5XZhAkBJ/8JjgXMe3Y/N13O4mzzF+k8xOFCo9QY
   /C1hi5e9M8B8ZXC0MgbZDiGqIN7+5s+vsedjP/TcQP8Yr5ZuVy1lvRn2+
   iDd6e+SrINn4gyld58bNc4P2JcWRwmPW6Lz25tIiD+DxuB5Z465CJdxBT
   8Inl1f2fzPMbV1kKH31AyGM/lBOo29NJbuXr1Hv19Nz9QwUs8hBaD0jK2
   EBBmhTAIsE60GPkV3FqAtfHjbfPfOybt5Y+erg4HKGEK8NVOwQma2Qt4S
   w==;
X-CSE-ConnectionGUID: TytbEybMTxqoDz0TykI0kA==
X-CSE-MsgGUID: YSpzdYHRRAmYw2QyiMv1yQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11671"; a="92421755"
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; 
   d="scan'208";a="92421755"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2026 17:46:39 -0800
X-CSE-ConnectionGUID: KyzJyaP9Sx6LiUyiMJLFTw==
X-CSE-MsgGUID: gr09AGQJRDW7gDvnCrxlgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; 
   d="scan'208";a="209336959"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 14 Jan 2026 17:46:38 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vgCRX-00000000HME-1far;
	Thu, 15 Jan 2026 01:46:35 +0000
Date: Thu, 15 Jan 2026 09:45:35 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:intel-6.6-PMT-enhancement-ANBZ27534
 23/23] drivers/infiniband/hw/erdma/compat/sw_recv.c:179:13: warning: variable
 'index' set but not used
Message-ID: <202601150912.UJ5A1BXI-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi =E7=BA=A2=E6=B5=B7,

FYI, the error/warning still remains.

tree:   https://gitee.com/anolis/intel-cloud-kernel.git intel-6.6-PMT-enhan=
cement-ANBZ27534
head:   5be39e8fdc241e57f9813026ad199ad5add77ce7
commit: 0d8609d9a6aaf8a7453a39d152afdacef8201ef1 [23/23] anolis: RDMA/erdma=
: Update erdma driver
config: x86_64-anolis-intel-cloud-devel-6.6 (https://download.01.org/0day-c=
i/archive/20260115/202601150912.UJ5A1BXI-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260115/202601150912.UJ5A1BXI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601150912.UJ5A1BXI-lkp@i=
ntel.com/

All warnings (new ones prefixed by >>):

   drivers/infiniband/hw/erdma/compat/sw_recv.c: In function 'hdr_check':
>> drivers/infiniband/hw/erdma/compat/sw_recv.c:179:13: warning: variable '=
index' set but not used [-Wunused-but-set-variable]
     179 |         int index;
         |             ^~~~~


vim +/index +179 drivers/infiniband/hw/erdma/compat/sw_recv.c

   171=09
   172	static int hdr_check(struct sw_pkt_info *pkt)
   173	{
   174		struct sw_dev *sw =3D pkt->sw;
   175		struct sw_port *port =3D &sw->port;
   176		struct erdma_qp *master_qp;
   177		struct sw_qp *qp =3D NULL;
   178		u32 qpn =3D bth_qpn(pkt);
 > 179		int index;
   180		int err;
   181=09
   182		if (unlikely(bth_tver(pkt) !=3D BTH_TVER)) {
   183			pr_warn_ratelimited("bad tver\n");
   184			goto err1;
   185		}
   186=09
   187		if (unlikely(qpn =3D=3D 0)) {
   188			pr_warn_once("QP 0 not supported");
   189			goto err1;
   190		}
   191=09
   192		if (qpn !=3D IB_MULTICAST_QPN) {
   193			index =3D (qpn =3D=3D 1) ? port->qp_gsi_index : qpn;
   194=09
   195			master_qp =3D find_qp_by_qpn(sw->master, qpn);/* gsi qpn pr_info -=
----*/
   196			if (unlikely(!master_qp || master_qp->attrs.flags & ERDMA_QP_IN_DE=
STROY)) {
   197				pr_warn_ratelimited("no qp matches qpn 0x%x\n", qpn);
   198				goto err1;
   199			}
   200=09
   201			//qp =3D sw_pool_get_index(&sw->qp_pool, index);
   202			qp =3D master_qp->sw_qp;
   203			if (unlikely(!qp)) {
   204				pr_warn_ratelimited("no qp matches qpn 0x%x\n", qpn);
   205				goto err1;
   206			}
   207			sw_add_ref(qp);
   208=09
   209			err =3D check_type_state(sw, pkt, qp);
   210			if (unlikely(err))
   211				goto err2;
   212=09
   213			err =3D check_addr(sw, pkt, qp);
   214			if (unlikely(err))
   215				goto err2;
   216=09
   217			err =3D check_keys(sw, pkt, qpn, qp);
   218			if (unlikely(err))
   219				goto err2;
   220		} else {
   221			if (unlikely((pkt->mask & SW_GRH_MASK) =3D=3D 0)) {
   222				pr_warn_ratelimited("no grh for mcast qpn\n");
   223				goto err1;
   224			}
   225		}
   226=09
   227		pkt->qp =3D qp;
   228		return 0;
   229=09
   230	err2:
   231		sw_drop_ref(qp);
   232	err1:
   233		return -EINVAL;
   234	}
   235=09

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
