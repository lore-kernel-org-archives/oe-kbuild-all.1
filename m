Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794233524;
	b=rHL5wDle9CSAdB4PzFj45WQBzUuXZRy+wk8x7urjl+ox99TTTpVMriXUEYgi9WJd72Tr
	 jA6hQvaw9zTItqy4obxAFD6EzoTmNjMSFE0zGy376o/cwKzl2Sj2yTnTv6faTljX7ZLyg
	 7alrxLHFn0cKlTKKqcNYyu23SaRutxqUCYrIZ34dUuJPKs5yhl8njo1i3FtBCtGSAUPSN
	 gmp4onL7cpc9zKgLVlPstnkegqzjzhXbPWyg+N9aQ77/ADSCdL/2h73maVw/iiiKzzN3n
	 s70pB94v0yNAH6ZlahNe5rD3PiHEsuVFs2rX7+9rbQcVisp+o2d6T65JJulPJkFceRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794233524;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=dtN3HfeZUFnPqHLGbWdXMLTdssM9GPNCwqTAXyxjBdg=;
	b=j/sRMIrASSszMOMLs68A46BiB2W0TKzLRjWmBWSjtSKVQ8S9D/JV+EhVOewpZqqA13Ud
	 9wi78l4/UrRDvQI8HREuytAal1RpXXilEm/thmqITxdellxioZ4qX2C9WcmeeOBumL/HU
	 I5kmmqcXA4xEJolJu75oiQmrgiuj4xJ5UJCEnkna9Rdl38kTnwofs8xFYnDvUnTIzQ6Nf
	 +pGFruzvuHmj4ZzzWfF5crb0sqZ+mqJ5KxHepW4EJRP/6UqPtgI6xQwVNAzndWhk23IaN
	 vZSfAjlEF26ay55Yaj5OMPelt3u/pOsM57N1JyJ8Fayp1fjanq+a3Atl4dMIYGpOsxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mV5hnysm;
	arc=none smtp.remote-ip=192.198.163.12
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFED1606A326
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Nov 2026 14:12:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CFED1606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mV5hnysm
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794233522; x=1825769522;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=aLEfEagxZu8iNBjb4OmmcwdhyYsXXs/14iUnSDdcsG8=;
  b=mV5hnysmSMRfFMd96tcxf24YJlFsH4Izn8c7+PhlDCw/SIyLUYUmYj5S
   uN1d1WOKA5Zp7YLMZEL7GwQoRsJ29iRzj5i+OSzxZzDReF1iaNEozZ5Y2
   vPgPQ5XCVW6ejvF8ULrMT1PRrTofjFMPvhl03I+WGu+b0amxmlRevxghl
   if718RbAEBzJJezVU+GszUxHyhNHUtt2OJQJDWV8HGr4yt4pBTfN7RNZL
   gmSH6clTmKtZ14UkAdYQRjeMRUyz3/FC8F4P+dzs4zYAMQRC8giL9EaQs
   X+CvzaveaEmXb0FVHtJAzd0hJBx+LE9I8/OaTqiaIWHDHTrEeV7yswfPC
   A==;
X-CSE-ConnectionGUID: teoZEffiRaOdakQxGuJ2Uw==
X-CSE-MsgGUID: aITXJPS7Q3S8HEdSTdEWFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11960"; a="2851586"
X-IronPort-AV: E=Sophos;i="6.27,203,1787036400"; 
   d="scan'208";a="2851586"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 06:12:02 -0800
X-CSE-ConnectionGUID: 8GF4tJncQf+tDgF99a44ww==
X-CSE-MsgGUID: bHTn/j41Tx+SNp5bmuDwKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,203,1787036400"; 
   d="scan'208";a="7900804"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 09 Nov 2026 06:12:01 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xQQ6I-00000000udL-3GX8;
	Mon, 09 Nov 2026 14:11:58 +0000
Date: Mon, 09 Nov 2026 22:11:31 +0800
From: kernel test robot <lkp@intel.com>
To: David Woodhouse <dwmw@amazon.co.uk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dwmw2:kvmclock13 8/24] arch/x86/kvm/x86.c:1634:undefined
 reference to `__udivdi3'
Message-ID: <202611092230.n6nRQpUH-lkp@intel.com>
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

tree:   git://git.infradead.org/users/dwmw2/linux kvmclock13
head:   1cf912d2cfcb64472a25b700313bd0189085d1e6
commit: 77b511238bef8ff8ec4aeebb23ab9a5b975f34b1 [8/24] KVM: x86: Re-synchr=
onize TSC after KVM_SET_TSC_KHZ
config: i386-randconfig-1011-20261109 (https://download.01.org/0day-ci/arch=
ive/20261109/202611092230.n6nRQpUH-lkp@intel.com/config)
compiler: gcc-13 (Debian 13.3.0-16) 13.3.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20261109/202611092230.n6nRQpUH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611092230.n6nRQpUH-lkp@i=
ntel.com/

All errors (new ones prefixed by >>):

   ld: arch/x86/kvm/x86.o: in function `kvm_synchronize_tsc_at':
>> arch/x86/kvm/x86.c:1634:(.text+0x10387): undefined reference to `__udivd=
i3'


vim +1634 arch/x86/kvm/x86.c

  1561=09
  1562	/*
  1563	 * Synchronize the vCPU's TSC against an explicit {host_tsc, ns} ref=
erence
  1564	 * point: @value (when non-NULL) is the guest TSC *at* @host_tsc, no=
t at
  1565	 * some unspecified "now". The offset is computed against that refer=
ence,
  1566	 * so a sampled value stays valid however much time passes between t=
he
  1567	 * sampling and this call.
  1568	 */
  1569	static void kvm_synchronize_tsc_at(struct kvm_vcpu *vcpu, u64 *value,
  1570					   u64 host_tsc, s64 ns, bool user_initiated)
  1571	{
  1572		u64 data =3D value ? *value : 0;
  1573		struct kvm *kvm =3D vcpu->kvm;
  1574		u64 offset, elapsed;
  1575		unsigned long flags;
  1576		bool matched =3D false;
  1577		bool synchronizing =3D false;
  1578=09
  1579		raw_spin_lock_irqsave(&kvm->arch.tsc_write_lock, flags);
  1580=09
  1581		offset =3D kvm_compute_l1_tsc_offset(vcpu, host_tsc, data);
  1582=09
  1583		/*
  1584		 * The {host_tsc, ns} reference may have been sampled before a
  1585		 * concurrent synchronization (on another vCPU) opened a newer
  1586		 * generation. The anchored offset above is still exact, but the
  1587		 * elapsed time would wrap; clamp it to the generation's origin.
  1588		 */
  1589		if (ns < kvm->arch.cur_tsc_nsec)
  1590			elapsed =3D 0;
  1591		else
  1592			elapsed =3D ns - kvm->arch.cur_tsc_nsec;
  1593=09
  1594		if (vcpu->arch.virtual_tsc_khz) {
  1595			if (data =3D=3D 0) {
  1596				/*
  1597				 * Force synchronization when creating a vCPU, or when
  1598				 * userspace explicitly writes a zero value.
  1599				 */
  1600				synchronizing =3D true;
  1601			} else if (kvm->arch.user_set_tsc || !user_initiated) {
  1602				u64 tsc_exp =3D kvm->arch.cur_tsc_write +
  1603							nsec_to_cycles(vcpu, elapsed);
  1604				u64 tsc_hz =3D vcpu->arch.virtual_tsc_khz * 1000LL;
  1605				u64 window;
  1606				/*
  1607				 * Here lies UAPI baggage: when a user-initiated TSC write has
  1608				 * a small delta (1 second) of virtual cycle time against the
  1609				 * previously set vCPU, we assume that they were intended to be
  1610				 * in sync and the delta was only due to the racy nature of the
  1611				 * legacy API.
  1612				 *
  1613				 * This trick falls down when restoring a guest which genuinely
  1614				 * has been running for less time than the 1 second of imprecision
  1615				 * which we allow for in the legacy API. In this case, the first
  1616				 * value written by userspace (on any vCPU) should not be subject
  1617				 * to this 'correction' to make it sync up with values that only
  1618				 * come from the kernel's default vCPU creation. Make the 1-second
  1619				 * slop hack only trigger if the user_set_tsc flag is already set.
  1620				 *
  1621				 * A kernel-internal write (a frequency change preserving the
  1622				 * guest TSC) carries an exact value sampled with its own
  1623				 * reference point, not a racy userspace one; a vCPU on the
  1624				 * generation's line still matches it to within arithmetic
  1625				 * rounding, but one which genuinely diverged (e.g. by a guest
  1626				 * TSC_ADJUST write) must not be snapped back by up to a
  1627				 * second. Use a 1ms window for those, unconditionally =E2=80=94
  1628				 * the sample's exactness owes nothing to the legacy API's
  1629				 * flag. A frequency *change* still only matches siblings
  1630				 * converted within 1ms=C2=B7F2/|F1-F2| of the first: values
  1631				 * preserved from the old frequency genuinely diverge from
  1632				 * the new generation's line at |F1-F2| per unit time.
  1633				 */
> 1634				window =3D user_initiated ? tsc_hz : tsc_hz / 1000;
  1635				synchronizing =3D data < tsc_exp + window &&
  1636						data + window > tsc_exp;
  1637			}
  1638		}
  1639=09
  1640=09
  1641		/*
  1642		 * For a reliable TSC, we can match TSC offsets, and for an unstable
  1643		 * TSC, we add elapsed time in this computation.  We could let the
  1644		 * compensation code attempt to catch up if we fall behind, but
  1645		 * it's better to try to match offsets from the beginning.
  1646	         */
  1647		if (synchronizing &&
  1648		    vcpu->arch.virtual_tsc_khz =3D=3D kvm->arch.cur_tsc_khz) {
  1649			/*
  1650			 * If synchronizing, extrapolate the generation's value to
  1651			 * "now": the matching window slides forward with wall time,
  1652			 * anchored on the generation's origin alone (a matched
  1653			 * write no longer updates any stored reference point).
  1654			 */
  1655			u64 delta =3D nsec_to_cycles(vcpu, elapsed);
  1656=09
  1657			data =3D kvm->arch.cur_tsc_write + delta;
  1658=09
  1659			if (!kvm_check_tsc_unstable())
  1660				offset =3D kvm->arch.cur_tsc_offset;
  1661			else
  1662				offset =3D kvm_compute_l1_tsc_offset(vcpu, host_tsc, data);
  1663			matched =3D true;
  1664		}
  1665=09
  1666		__kvm_synchronize_tsc(vcpu, offset, data, ns, matched, user_initiat=
ed);
  1667		raw_spin_unlock_irqrestore(&kvm->arch.tsc_write_lock, flags);
  1668	}
  1669=09

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
