Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9901E30F55B
	for <oe-kbuild-all@lists.linux.dev>; Tue, 19 May 2026 02:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779156800; cv=none; b=hC4gFCxhP10SYcsaGVFECx10mCBIdcJekf7KWpRgbXmdyQX2ffR7zSKDOHOKuWm/4ViGt7cyZyPoEbZkNy43oBSd8DxC1njqAeiMrdbx4wejNL06qoaLJY9xGQYEOGlVly0aoD3gQJnPKdCEzI0gNQ1/jVTYx1tXk5gOuXCMslk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779156800; c=relaxed/simple;
	bh=QjHNu/G+7f4vRQ5A8bBbbSaa/LUAOJPSNBneKfU9Mds=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Wln3tnA0RjzrVvRPv641YLi1j2CDbdqC9bDxYGb19dZvt1VHfNPKdbIwIGno7Qucts0UrqPHlNGogNxANMMsoFcUnyNMQWdXX4mfjNzjTxhjhnQmkUp5QkzFrKtWYM78wUG1DtzKZHQe4zEvI1yPdILxHRCawci/Eag0sB1CmNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RLzeLp9f; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RLzeLp9f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779156798; x=1810692798;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=QjHNu/G+7f4vRQ5A8bBbbSaa/LUAOJPSNBneKfU9Mds=;
  b=RLzeLp9fuaN9/SMXELI4q/e36q0dAAB2tSEJpKEEnX+rMnZN53ymAayG
   wy1/1goumZfkVPXk5A3xIL5q4vYWlDgYs0lk+IuM068eQidd8ZcXNGJTa
   EjovWZwNYPxcfUEUoyYx5YD//JJDSQSS61J4O3kwDjRy9wTHUwnomDGwM
   IZGEGrZX8yBpaZMC8/9JdHjMiHJTmHwDvT1qKHDqJMdrU7/3WdElglz08
   SDccS7gbLWaGOfy186dCt3KkoX+Az1XmlVFcKTrZ9XXUFuxxJh/vVAxI0
   +GSZXsDeqWbWWUItribZb52yGBGQLgedtYq42DEQA8qg4WFmRkvjqUVSt
   w==;
X-CSE-ConnectionGUID: K5LYoz89TV29yjjmRrDM0g==
X-CSE-MsgGUID: mQvlg5R1Q0yMKuLHZ2PFzg==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="79876123"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="79876123"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2026 19:13:16 -0700
X-CSE-ConnectionGUID: ey1kc1yxSsCp5y+Wp5gTeA==
X-CSE-MsgGUID: SdMKif1IQHuhayPR+k03eA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="235167846"
Received: from lkp-server02.sh.intel.com (HELO 30e86e9c1927) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 18 May 2026 19:13:14 -0700
Received: from kbuild by 30e86e9c1927 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wP9xH-0000000004A-3LH8;
	Tue, 19 May 2026 02:13:11 +0000
Date: Tue, 19 May 2026 07:48:35 +0800
From: kernel test robot <lkp@intel.com>
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rppt:gfp-to-kmalloc/v0.1 68/238]
 arch/powerpc/kvm/book3s_xive.c:1806:29: warning: unused variable 'xive'
Message-ID: <202605190742.m6lJMs0x-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git gfp-=
to-kmalloc/v0.1
head:   cf8f69ff9142effba4d8d9a70a1a4f275044376c
commit: 13dfb236bc5e7a1436c16626131957627397d6a6 [68/238] KVM: PPC: Book3S =
HV: replace __get_free_pages() with kmalloc()
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20260=
519/202605190742.m6lJMs0x-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 15.2.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260519/202605190742.m6lJMs0x-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605190742.m6lJMs0x-lkp@i=
ntel.com/

All warnings (new ones prefixed by >>):

   arch/powerpc/kvm/book3s_xive.c: In function 'kvmppc_xive_cleanup_vcpu':
>> arch/powerpc/kvm/book3s_xive.c:1806:29: warning: unused variable 'xive' =
[-Wunused-variable]
    1806 |         struct kvmppc_xive *xive =3D vcpu->kvm->arch.xive;
         |                             ^~~~


vim +/xive +1806 arch/powerpc/kvm/book3s_xive.c

da15c03b047dca Paul Mackerras            2019-08-13  1802 =20
5af50993850a48 Benjamin Herrenschmidt    2017-04-05  1803  void kvmppc_xive=
_cleanup_vcpu(struct kvm_vcpu *vcpu)
5af50993850a48 Benjamin Herrenschmidt    2017-04-05  1804  {
5af50993850a48 Benjamin Herrenschmidt    2017-04-05  1805  	struct kvmppc_x=
ive_vcpu *xc =3D vcpu->arch.xive_vcpu;
5422e95103cf96 C=C3=A9dric Le Goater          2019-04-18 @1806  	struct kvm=
ppc_xive *xive =3D vcpu->kvm->arch.xive;
5af50993850a48 Benjamin Herrenschmidt    2017-04-05  1807  	int i;
5af50993850a48 Benjamin Herrenschmidt    2017-04-05  1808 =20
5422e95103cf96 C=C3=A9dric Le Goater          2019-04-18  1809  	if (!kvmpp=
c_xics_enabled(vcpu))
5422e95103cf96 C=C3=A9dric Le Goater          2019-04-18  1810  		return;
5422e95103cf96 C=C3=A9dric Le Goater          2019-04-18  1811 =20
5422e95103cf96 C=C3=A9dric Le Goater          2019-04-18  1812  	if (!xc)
5422e95103cf96 C=C3=A9dric Le Goater          2019-04-18  1813  		return;
5422e95103cf96 C=C3=A9dric Le Goater          2019-04-18  1814 =20
5af50993850a48 Benjamin Herrenschmidt    2017-04-05  1815  	pr_devel("clean=
up_vcpu(cpu=3D%d)\n", xc->server_num);
5af50993850a48 Benjamin Herrenschmidt    2017-04-05  1816 =20
5af50993850a48 Benjamin Herrenschmidt    2017-04-05  1817  	/* Ensure no in=
terrupt is still routed to that VP */
5af50993850a48 Benjamin Herrenschmidt    2017-04-05  1818  	xc->valid =3D f=
alse;
5af50993850a48 Benjamin Herrenschmidt    2017-04-05  1819  	kvmppc_xive_dis=
able_vcpu_interrupts(vcpu);
5af50993850a48 Benjamin Herrenschmidt    2017-04-05  1820 =20
5af50993850a48 Benjamin Herrenschmidt    2017-04-05  1821  	/* Mask the VP =
IPI */
5af50993850a48 Benjamin Herrenschmidt    2017-04-05  1822  	xive_vm_esb_loa=
d(&xc->vp_ipi_data, XIVE_ESB_SET_PQ_01);
5af50993850a48 Benjamin Herrenschmidt    2017-04-05  1823 =20
237aed48c64232 C=C3=A9dric Le Goater          2019-08-06  1824  	/* Free es=
calations */
5af50993850a48 Benjamin Herrenschmidt    2017-04-05  1825  	for (i =3D 0; i=
 < KVMPPC_XIVE_Q_COUNT; i++) {
5af50993850a48 Benjamin Herrenschmidt    2017-04-05  1826  		if (xc->esc_vi=
rq[i]) {
b68c6646cce5ee C=C3=A9dric Le Goater          2021-07-20  1827  			if (kvmp=
pc_xive_has_single_escalation(xc->xive))
932c6dea4f32f7 Deming Wang               2022-04-13  1828  				xive_cleanup=
_single_escalation(vcpu, xc->esc_virq[i]);
5af50993850a48 Benjamin Herrenschmidt    2017-04-05  1829  			free_irq(xc->=
esc_virq[i], vcpu);
5af50993850a48 Benjamin Herrenschmidt    2017-04-05  1830  			irq_dispose_m=
apping(xc->esc_virq[i]);
5af50993850a48 Benjamin Herrenschmidt    2017-04-05  1831  			kfree(xc->esc=
_virq_names[i]);
5af50993850a48 Benjamin Herrenschmidt    2017-04-05  1832  		}
237aed48c64232 C=C3=A9dric Le Goater          2019-08-06  1833  	}
237aed48c64232 C=C3=A9dric Le Goater          2019-08-06  1834 =20
237aed48c64232 C=C3=A9dric Le Goater          2019-08-06  1835  	/* Disable=
 the VP */
237aed48c64232 C=C3=A9dric Le Goater          2019-08-06  1836  	xive_nativ=
e_disable_vp(xc->vp_id);
237aed48c64232 C=C3=A9dric Le Goater          2019-08-06  1837 =20
8d4ba9c931bc38 Paul Mackerras            2019-08-13  1838  	/* Clear the ca=
m word so guest entry won't try to push context */
8d4ba9c931bc38 Paul Mackerras            2019-08-13  1839  	vcpu->arch.xive=
_cam_word =3D 0;
8d4ba9c931bc38 Paul Mackerras            2019-08-13  1840 =20
237aed48c64232 C=C3=A9dric Le Goater          2019-08-06  1841  	/* Free th=
e queues */
237aed48c64232 C=C3=A9dric Le Goater          2019-08-06  1842  	for (i =3D =
0; i < KVMPPC_XIVE_Q_COUNT; i++) {
237aed48c64232 C=C3=A9dric Le Goater          2019-08-06  1843  		struct xi=
ve_q *q =3D &xc->queues[i];
237aed48c64232 C=C3=A9dric Le Goater          2019-08-06  1844 =20
5af50993850a48 Benjamin Herrenschmidt    2017-04-05  1845  		xive_native_di=
sable_queue(xc->vp_id, q, i);
5af50993850a48 Benjamin Herrenschmidt    2017-04-05  1846  		if (q->qpage) {
13dfb236bc5e7a Mike Rapoport (Microsoft  2026-02-10  1847) 			kfree((void *=
)(unsigned long)q->qpage);
5af50993850a48 Benjamin Herrenschmidt    2017-04-05  1848  			q->qpage =3D =
NULL;
5af50993850a48 Benjamin Herrenschmidt    2017-04-05  1849  		}
5af50993850a48 Benjamin Herrenschmidt    2017-04-05  1850  	}
5af50993850a48 Benjamin Herrenschmidt    2017-04-05  1851 =20
5af50993850a48 Benjamin Herrenschmidt    2017-04-05  1852  	/* Free the IPI=
 */
5af50993850a48 Benjamin Herrenschmidt    2017-04-05  1853  	if (xc->vp_ipi)=
 {
5af50993850a48 Benjamin Herrenschmidt    2017-04-05  1854  		xive_cleanup_i=
rq_data(&xc->vp_ipi_data);
5af50993850a48 Benjamin Herrenschmidt    2017-04-05  1855  		xive_native_fr=
ee_irq(xc->vp_ipi);
5af50993850a48 Benjamin Herrenschmidt    2017-04-05  1856  	}
5af50993850a48 Benjamin Herrenschmidt    2017-04-05  1857  	/* Free the VP =
*/
5af50993850a48 Benjamin Herrenschmidt    2017-04-05  1858  	kfree(xc);
5422e95103cf96 C=C3=A9dric Le Goater          2019-04-18  1859 =20
5422e95103cf96 C=C3=A9dric Le Goater          2019-04-18  1860  	/* Cleanup=
 the vcpu */
5422e95103cf96 C=C3=A9dric Le Goater          2019-04-18  1861  	vcpu->arch=
.irq_type =3D KVMPPC_IRQ_DEFAULT;
5422e95103cf96 C=C3=A9dric Le Goater          2019-04-18  1862  	vcpu->arch=
.xive_vcpu =3D NULL;
5af50993850a48 Benjamin Herrenschmidt    2017-04-05  1863  }
5af50993850a48 Benjamin Herrenschmidt    2017-04-05  1864 =20

:::::: The code at line 1806 was first introduced by commit
:::::: 5422e95103cf9663bc86cf1056a3ea44c2e2f09e KVM: PPC: Book3S HV: XIVE: =
Replace the 'destroy' method by a 'release' method

:::::: TO: C=C3=A9dric Le Goater <clg@kaod.org>
:::::: CC: Paul Mackerras <paulus@ozlabs.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
