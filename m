Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49F31492533
	for <oe-kbuild-all@lists.linux.dev>; Wed,  3 Jun 2026 21:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780522461; cv=none; b=DujR+jIvnf87CWgSw6tYa/6iJaA6QkNehaY8egX6zt1SH/pvDk8DKbGFYFGIWn0laQtO88COf4YHTBT/1BYE++hqTeBoRFrPQh6LOtCVjqBW34DSFuTbe/7fp+4c07RHlv/yVAYrpDGLdieITss0nRQU2NiOsI7702U3ENKa5y8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780522461; c=relaxed/simple;
	bh=xZHL/ZZ96np+YUP97ZF0eRuZq6N1wYIrgghG8u9I6nA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=tJle/vnN/UEXSfwDTnQhQ/MH7g9Alj87OwBFpV/zYlac7/DMQ7LTJRa7vWEA+tLwiInia6S7/wVcPUh1KflNAUNxY5SkqNdLcp+tqYX27vCNIEWebRPWUBVibcDoN5iJgHpR0yvzxztjvKWiFMlCSkK2P5iwx1jLdmsAXzfWtjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FEnmKwWh; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FEnmKwWh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780522459; x=1812058459;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=xZHL/ZZ96np+YUP97ZF0eRuZq6N1wYIrgghG8u9I6nA=;
  b=FEnmKwWhcqW9yNVuJ0yLT2IILVdt19ymCtIO4XuXyRAv9gah4XcrEKt5
   03wIi6Apsh9z832WYOu7NA4dV3mzEIoFU/m/4rWllUcDFxMiq4FtBr9YK
   jkTN3iGQZjZMemlfw2AlDhqJDZnYQ3C1CXKP0O24WMEmdpXcNsntSKyDX
   Qb1KRYaLTH+1SxD62QCCurq6O/1IX6+n25P+YDB//0uhvvk0E/1N2ij8z
   7emjBwh6gU4YZgZOgN6oYxMDPEZgMwxFzWvbbdG71uYzVU6Bn0Qta7VTV
   brViUraawmYHOeH8BQarNys/o1EwNhT5M2X9WUlqwQVC9AZRcWSMyZn5F
   w==;
X-CSE-ConnectionGUID: vYcD3EJaSB2kbH9VxmPyTA==
X-CSE-MsgGUID: 1umQ4Y0qSI6ETZwAKV424Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11806"; a="81322415"
X-IronPort-AV: E=Sophos;i="6.24,185,1774335600"; 
   d="scan'208";a="81322415"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2026 14:34:16 -0700
X-CSE-ConnectionGUID: mTEDkNDtRm+R/A8je7kidA==
X-CSE-MsgGUID: 2Uh6rnuaQy2FYOajmmO5cw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,185,1774335600"; 
   d="scan'208";a="238014232"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 03 Jun 2026 14:34:14 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wUtE3-00000000Dum-392F;
	Wed, 03 Jun 2026 21:34:11 +0000
Date: Thu, 04 Jun 2026 05:33:50 +0800
From: kernel test robot <lkp@intel.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: oe-kbuild-all@lists.linux.dev, Thomas Gleixner <tglx@kernel.org>
Subject: [tglx-devel:irq/constify 7/8]
 arch/powerpc/kvm/book3s_hv.c:6000:39: warning: passing argument 1 of
 'is_pnv_opal_msi' discards 'const' qualifier from pointer target type
Message-ID: <202606040526.w4YIOsj1-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git irq/=
constify
head:   2e8b4859e87ef8229ab12228b5e484171084a127
commit: a06afaa6b498608502f806862646abb90720927b [7/8] treewide: Constify s=
ome struct irq_chip *
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20260=
604/202606040526.w4YIOsj1-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 15.2.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260604/202606040526.w4YIOsj1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606040526.w4YIOsj1-lkp@i=
ntel.com/

All warnings (new ones prefixed by >>):

   arch/powerpc/kvm/book3s_hv.c: In function 'kvmppc_set_passthru_irq':
>> arch/powerpc/kvm/book3s_hv.c:6000:39: warning: passing argument 1 of 'is=
_pnv_opal_msi' discards 'const' qualifier from pointer target type [-Wdisca=
rded-qualifiers]
    6000 |         if (!chip || !is_pnv_opal_msi(chip)) {
         |                                       ^~~~
   In file included from arch/powerpc/kvm/book3s_hv.c:72:
   arch/powerpc/include/asm/pnv-pci.h:28:39: note: expected 'struct irq_chi=
p *' but argument is of type 'const struct irq_chip *'
      28 | bool is_pnv_opal_msi(struct irq_chip *chip);
         |                      ~~~~~~~~~~~~~~~~~^~~~


vim +6000 arch/powerpc/kvm/book3s_hv.c

c57875f5f9be2c Suresh Warrier         2016-08-19  5964 =20
c57875f5f9be2c Suresh Warrier         2016-08-19  5965  static int kvmppc_s=
et_passthru_irq(struct kvm *kvm, int host_irq, int guest_gsi)
c57875f5f9be2c Suresh Warrier         2016-08-19  5966  {
c57875f5f9be2c Suresh Warrier         2016-08-19  5967  	struct irq_desc *d=
esc;
c57875f5f9be2c Suresh Warrier         2016-08-19  5968  	struct kvmppc_irq_=
map *irq_map;
c57875f5f9be2c Suresh Warrier         2016-08-19  5969  	struct kvmppc_pass=
thru_irqmap *pimap;
a06afaa6b49860 Christophe JAILLET     2026-06-01  5970  	const struct irq_c=
hip *chip;
5af50993850a48 Benjamin Herrenschmidt 2017-04-05  5971  	int i, rc =3D 0;
1753081f2d445f C=C3=A9dric Le Goater       2021-07-01  5972  	struct irq_da=
ta *host_data;
c57875f5f9be2c Suresh Warrier         2016-08-19  5973 =20
644abbb254b1ab Suresh Warrier         2016-08-19  5974  	if (!kvm_irq_bypas=
s)
644abbb254b1ab Suresh Warrier         2016-08-19  5975  		return 1;
644abbb254b1ab Suresh Warrier         2016-08-19  5976 =20
c57875f5f9be2c Suresh Warrier         2016-08-19  5977  	desc =3D irq_to_de=
sc(host_irq);
c57875f5f9be2c Suresh Warrier         2016-08-19  5978  	if (!desc)
c57875f5f9be2c Suresh Warrier         2016-08-19  5979  		return -EIO;
c57875f5f9be2c Suresh Warrier         2016-08-19  5980 =20
c57875f5f9be2c Suresh Warrier         2016-08-19  5981  	mutex_lock(&kvm->l=
ock);
c57875f5f9be2c Suresh Warrier         2016-08-19  5982 =20
c57875f5f9be2c Suresh Warrier         2016-08-19  5983  	pimap =3D kvm->arc=
h.pimap;
c57875f5f9be2c Suresh Warrier         2016-08-19  5984  	if (pimap =3D=3D N=
ULL) {
c57875f5f9be2c Suresh Warrier         2016-08-19  5985  		/* First call, al=
locate structure to hold IRQ map */
c57875f5f9be2c Suresh Warrier         2016-08-19  5986  		pimap =3D kvmppc_=
alloc_pimap();
c57875f5f9be2c Suresh Warrier         2016-08-19  5987  		if (pimap =3D=3D =
NULL) {
c57875f5f9be2c Suresh Warrier         2016-08-19  5988  			mutex_unlock(&kv=
m->lock);
c57875f5f9be2c Suresh Warrier         2016-08-19  5989  			return -ENOMEM;
c57875f5f9be2c Suresh Warrier         2016-08-19  5990  		}
c57875f5f9be2c Suresh Warrier         2016-08-19  5991  		kvm->arch.pimap =
=3D pimap;
c57875f5f9be2c Suresh Warrier         2016-08-19  5992  	}
c57875f5f9be2c Suresh Warrier         2016-08-19  5993 =20
c57875f5f9be2c Suresh Warrier         2016-08-19  5994  	/*
c57875f5f9be2c Suresh Warrier         2016-08-19  5995  	 * For now, we onl=
y support interrupts for which the EOI operation
c57875f5f9be2c Suresh Warrier         2016-08-19  5996  	 * is an OPAL call=
 followed by a write to XIRR, since that's
5af50993850a48 Benjamin Herrenschmidt 2017-04-05  5997  	 * what our real-m=
ode EOI code does, or a XIVE interrupt
c57875f5f9be2c Suresh Warrier         2016-08-19  5998  	 */
c57875f5f9be2c Suresh Warrier         2016-08-19  5999  	chip =3D irq_data_=
get_irq_chip(&desc->irq_data);
ba418a0278265a C=C3=A9dric Le Goater       2021-07-01 @6000  	if (!chip || =
!is_pnv_opal_msi(chip)) {
c57875f5f9be2c Suresh Warrier         2016-08-19  6001  		pr_warn("kvmppc_s=
et_passthru_irq_hv: Could not assign IRQ map for (%d,%d)\n",
c57875f5f9be2c Suresh Warrier         2016-08-19  6002  			host_irq, guest_=
gsi);
c57875f5f9be2c Suresh Warrier         2016-08-19  6003  		mutex_unlock(&kvm=
->lock);
c57875f5f9be2c Suresh Warrier         2016-08-19  6004  		return -ENOENT;
c57875f5f9be2c Suresh Warrier         2016-08-19  6005  	}
c57875f5f9be2c Suresh Warrier         2016-08-19  6006 =20
c57875f5f9be2c Suresh Warrier         2016-08-19  6007  	/*
c57875f5f9be2c Suresh Warrier         2016-08-19  6008  	 * See if we alrea=
dy have an entry for this guest IRQ number.
c57875f5f9be2c Suresh Warrier         2016-08-19  6009  	 * If it's mapped =
to a hardware IRQ number, that's an error,
c57875f5f9be2c Suresh Warrier         2016-08-19  6010  	 * otherwise re-us=
e this entry.
c57875f5f9be2c Suresh Warrier         2016-08-19  6011  	 */
c57875f5f9be2c Suresh Warrier         2016-08-19  6012  	for (i =3D 0; i < =
pimap->n_mapped; i++) {
c57875f5f9be2c Suresh Warrier         2016-08-19  6013  		if (guest_gsi =3D=
=3D pimap->mapped[i].v_hwirq) {
c57875f5f9be2c Suresh Warrier         2016-08-19  6014  			if (pimap->mappe=
d[i].r_hwirq) {
c57875f5f9be2c Suresh Warrier         2016-08-19  6015  				mutex_unlock(&k=
vm->lock);
c57875f5f9be2c Suresh Warrier         2016-08-19  6016  				return -EINVAL;
c57875f5f9be2c Suresh Warrier         2016-08-19  6017  			}
c57875f5f9be2c Suresh Warrier         2016-08-19  6018  			break;
c57875f5f9be2c Suresh Warrier         2016-08-19  6019  		}
c57875f5f9be2c Suresh Warrier         2016-08-19  6020  	}
c57875f5f9be2c Suresh Warrier         2016-08-19  6021 =20
c57875f5f9be2c Suresh Warrier         2016-08-19  6022  	if (i =3D=3D KVMPP=
C_PIRQ_MAPPED) {
c57875f5f9be2c Suresh Warrier         2016-08-19  6023  		mutex_unlock(&kvm=
->lock);
c57875f5f9be2c Suresh Warrier         2016-08-19  6024  		return -EAGAIN;		=
/* table is full */
c57875f5f9be2c Suresh Warrier         2016-08-19  6025  	}
c57875f5f9be2c Suresh Warrier         2016-08-19  6026 =20
c57875f5f9be2c Suresh Warrier         2016-08-19  6027  	irq_map =3D &pimap=
->mapped[i];
c57875f5f9be2c Suresh Warrier         2016-08-19  6028 =20
c57875f5f9be2c Suresh Warrier         2016-08-19  6029  	irq_map->v_hwirq =
=3D guest_gsi;
c57875f5f9be2c Suresh Warrier         2016-08-19  6030  	irq_map->desc =3D =
desc;
c57875f5f9be2c Suresh Warrier         2016-08-19  6031 =20
e3c13e56a4717e Suresh Warrier         2016-08-19  6032  	/*
e3c13e56a4717e Suresh Warrier         2016-08-19  6033  	 * Order the above=
 two stores before the next to serialize with
e3c13e56a4717e Suresh Warrier         2016-08-19  6034  	 * the KVM real mo=
de handler.
e3c13e56a4717e Suresh Warrier         2016-08-19  6035  	 */
e3c13e56a4717e Suresh Warrier         2016-08-19  6036  	smp_wmb();
1753081f2d445f C=C3=A9dric Le Goater       2021-07-01  6037 =20
1753081f2d445f C=C3=A9dric Le Goater       2021-07-01  6038  	/*
1753081f2d445f C=C3=A9dric Le Goater       2021-07-01  6039  	 * The 'host_=
irq' number is mapped in the PCI-MSI domain but
1753081f2d445f C=C3=A9dric Le Goater       2021-07-01  6040  	 * the underl=
ying calls, which will EOI the interrupt in real
1753081f2d445f C=C3=A9dric Le Goater       2021-07-01  6041  	 * mode, need=
 an HW IRQ number mapped in the XICS IRQ domain.
1753081f2d445f C=C3=A9dric Le Goater       2021-07-01  6042  	 */
0a27ea384c82e7 Jiri Slaby (SUSE       2025-03-19  6043) 	host_data =3D irq_=
domain_get_irq_data(irq_get_default_domain(), host_irq);
1753081f2d445f C=C3=A9dric Le Goater       2021-07-01  6044  	irq_map->r_hw=
irq =3D (unsigned int)irqd_to_hwirq(host_data);
e3c13e56a4717e Suresh Warrier         2016-08-19  6045 =20
c57875f5f9be2c Suresh Warrier         2016-08-19  6046  	if (i =3D=3D pimap=
->n_mapped)
c57875f5f9be2c Suresh Warrier         2016-08-19  6047  		pimap->n_mapped++;
c57875f5f9be2c Suresh Warrier         2016-08-19  6048 =20
03f953329bd872 Paul Mackerras         2019-02-04  6049  	if (xics_on_xive())
e5e78b15113a73 C=C3=A9dric Le Goater       2021-07-01  6050  		rc =3D kvmpp=
c_xive_set_mapped(kvm, guest_gsi, host_irq);
5af50993850a48 Benjamin Herrenschmidt 2017-04-05  6051  	else
1753081f2d445f C=C3=A9dric Le Goater       2021-07-01  6052  		kvmppc_xics_=
set_mapped(kvm, guest_gsi, irq_map->r_hwirq);
5af50993850a48 Benjamin Herrenschmidt 2017-04-05  6053  	if (rc)
5af50993850a48 Benjamin Herrenschmidt 2017-04-05  6054  		irq_map->r_hwirq =
=3D 0;
5d375199ea963f Paul Mackerras         2016-08-19  6055 =20
c57875f5f9be2c Suresh Warrier         2016-08-19  6056  	mutex_unlock(&kvm-=
>lock);
c57875f5f9be2c Suresh Warrier         2016-08-19  6057 =20
c57875f5f9be2c Suresh Warrier         2016-08-19  6058  	return 0;
c57875f5f9be2c Suresh Warrier         2016-08-19  6059  }
c57875f5f9be2c Suresh Warrier         2016-08-19  6060 =20

:::::: The code at line 6000 was first introduced by commit
:::::: ba418a0278265ad65f2f9544e743b7dbff3b994b KVM: PPC: Book3S HV: Use th=
e new IRQ chip to detect passthrough interrupts

:::::: TO: C=C3=A9dric Le Goater <clg@kaod.org>
:::::: CC: Michael Ellerman <mpe@ellerman.id.au>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
