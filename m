Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C0224446FD
	for <oe-kbuild-all@lists.linux.dev>; Tue,  4 Aug 2026 10:36:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785839793; cv=none; b=YKXrgmzUV138NYdKRRAw9bDo/m0OQU1A6moXxVTD+mGdJhNWX3z/NT9lOlkrqTzU/JO/cBAbcrbDEgogeXInUH4OFlF2ORQMZVM0kPjmdjlgTh7sxzIPCiQWWE0M6T9kczRljPYYyrNp/p/yPVz9j4ewxDfB2hetbpY5PBnx8fA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785839793; c=relaxed/simple;
	bh=1RYjoDtNBoFjk0SBG/FnVL++J8oGYqCuAhSstuUqElM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tVxb0xRpacGHvq7UOmKDfEESeFKnwTqHT2X3AhI/f+SpKLtQ8KAWv+sTUy42QZuuA4a9x0JlE0SNDfXaD5Ty8792RopIePROLD1Bo6UagaVRgXSmo9/QMLgOSRIKAhEosT1cRnDS64gTcKEqYUk+paQ31Uegt7aRnfomBl8T4a0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=HCbppXss; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="HCbppXss"
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6748HYIT295950;
	Tue, 4 Aug 2026 10:36:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=Ve/qHW4urLCjauRbPphX9OvXNTKEb7
	8k4OMcTbXwu70=; b=HCbppXssQg9mPPur8dD7jvkieroG1ka6axrGaekPzaTGkd
	otIv7YxAKPexWmycIByjv3zqGFv8FJxnQe+H0GLIzFY/FvKGpIPRR7HU/2Ds2J9m
	BoAhD2Wq1MfSQ0kmEj8AVdTX2aEEeYr2I87tylZJUkg/N0UxctS1RK/ueePfCiM1
	XGmYnHEBsmYjvJl4UkRFDoYMEnMc3302OCgCsF8idAl9LNUrNfgz08GQtsIZNOK3
	3i3Y8juG9RsD5tpJESSRGSqyIaOiMnQQde7ahdHrFHXXeyZIfNRhPJRl4lxJkCbG
	DQhk6vkK0a3vgGHJaO1MOQ7S0iT397KnTa+ZjVaQ==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4fs8a3wccm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Aug 2026 10:36:30 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 674AQG5R005296;
	Tue, 4 Aug 2026 10:36:29 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4fsvmh9fjn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Aug 2026 10:36:29 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 674AaP2h31588794
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 4 Aug 2026 10:36:25 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 26E842004D;
	Tue,  4 Aug 2026 10:36:25 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9D7AC20043;
	Tue,  4 Aug 2026 10:36:23 +0000 (GMT)
Received: from fedora (unknown [9.5.7.39])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Tue,  4 Aug 2026 10:36:23 +0000 (GMT)
Date: Tue, 4 Aug 2026 16:07:06 +0530
From: Amit Machhiwal <amachhiw@linux.ibm.com>
To: kernel test robot <lkp@intel.com>
Cc: Amit Machhiwal <amachhiw@linux.ibm.com>, oe-kbuild-all@lists.linux.dev,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Vaibhav Jain <vaibhav@linux.ibm.com>,
        "Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>,
        "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Subject: Re: [linuxppc:merge-test 6/19] arch/powerpc/kvm/powerpc.c:262:19:
 error: dereferencing pointer to incomplete type 'struct kvmppc_vcore'
Message-ID: <20260804160328.9be8138c-1f-amachhiw@linux.ibm.com>
References: <202608030623.cXr4111l-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202608030623.cXr4111l-lkp@intel.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=E6P9Y6dl c=1 sm=1 tr=0 ts=6a71c0ae cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=iQ6ETzBq9ecOQQE5vZCe:22 a=NEAV23lmAAAA:8
 a=i3X5FwGiAAAA:8 a=QyXUC8HyAAAA:8 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8
 a=9kqrFuD3uXMJ-oZv9YQA:9 a=CjuIK1q_8ugA:10 a=mmqRlSCDY2ywfjPLJ4af:22
X-Proofpoint-ORIG-GUID: 5hBcNUQ7ZCEl2fUKhfGPu_LbzSRy70h4
X-Proofpoint-GUID: OcqwSq-TvrA7vAcKFmMsO1zklMTG6gcF
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA0MDA4MSBTYWx0ZWRfX4kr0W/GvJllZ
 sVrAvL5It1kzIReE1rcgFczuJbDB0ZjJELLfp0Y3C00G6x1Sz/nqxsb8TsbBn3tcvTvWiLFD/Ne
 XAkAMQTMTGDaKbDuVsHiIwg0jL5jTiw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA0MDA4MSBTYWx0ZWRfXyeEUG3bs5Mc/
 cn57vU1wwQQiUPe99I9F5pwITawffMQzFtFeSfC5gyDPJkk1DVHKQfUx+c6x+7av8PmDbx8Ozj3
 NS99YgMPkdKWlQTvfSoRn/ptCAYZpgZT7n4r6qCrUMXbvvU1GuH4x/lkpVmY/JNcSiEvWJYg91f
 lGLAuZWCDbHCER8GQgAjg/KZyfGAlDKpddRVU6144+BwupWZPkSF2BbLmmttrnkFM9qEvJp7bpz
 OkT8/uGOL8bb6efG5fK2sIjxBgGDOfQRR+sg3pM8/Nrbn3ekTCWIP9qbGgv/yMsg69mEBE2njUK
 9Q2/vgynP2cTa0Bc8Z9G/hyqeigl+WE2Jjqw6odYPt6SKtDP4oMeqiYr6cIugQfbe9m2ZjKgIu9
 qIwPhlQCY32u579c/NwgIPK/uLkjF7aQRj5rbFOVaCkEGO3Cd5wgTF8mhsi8wHMuIHAlAL0H9UG
 pe4lgOQeI/i3QCr7cAw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_02,2026-08-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 adultscore=0 spamscore=0 malwarescore=0 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608040081

On 2026/08/03 06:26 AM, kernel test robot wrote:
> tree:   https://github.com/linuxppc/linux merge-test
> head:   f5ee8a918bf98d0bb46b91ffbb4283a64f17c3fd
> commit: a7452640914469676b5fcffee80ee045525bddb8 [6/19] KVM: PPC: Book3S HV: Validate arch_compat against host compatibility mode
> config: powerpc64-randconfig-002-20260803 (https://download.01.org/0day-ci/archive/20260803/202608030623.cXr4111l-lkp@intel.com/config)
> compiler: powerpc64-linux-gcc (GCC) 8.5.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260803/202608030623.cXr4111l-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202608030623.cXr4111l-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    arch/powerpc/kvm/powerpc.c: In function 'kvmppc_sanity_check':
> >> arch/powerpc/kvm/powerpc.c:262:19: error: dereferencing pointer to incomplete type 'struct kvmppc_vcore'
>       vcpu->arch.vcore->arch_compat == PVR_ARCH_INVALID)
>                       ^~

Looks like the branch has an older version of the patch applied. I
checked the powerpc64-randconfig-002-20260803 config which has below KVM
configs enabled.

  CONFIG_KVM_GUEST=y
  CONFIG_KVM_COMMON=y
  CONFIG_KVM_MMIO=y
  CONFIG_KVM_VFIO=y
  CONFIG_KVM_COMPAT=y
  CONFIG_HAVE_KVM_IRQ_BYPASS=y
  CONFIG_KVM=y
  CONFIG_KVM_BOOKE_HV=y
  # CONFIG_KVM_EXIT_TIMING is not set
  CONFIG_KVM_E500MC=y
  # CONFIG_KVM_MPIC is not set

The v5 of patch already gates the reported block inside
CONFIG_KVM_BOOK3S_HV_POSSIBLE which will avoid such build failures.

v5: https://lore.kernel.org/all/20260714175432.86388-1-amachhiw@linux.ibm.com/

@Maddy, could you please pick the latest version which was sent on Jul
14.

Thanks,
Amit

> 
> 
> vim +262 arch/powerpc/kvm/powerpc.c
> 
>    252	
>    253	int kvmppc_sanity_check(struct kvm_vcpu *vcpu)
>    254	{
>    255		int r = false;
>    256	
>    257		/* We have to know what CPU to virtualize */
>    258		if (!vcpu->arch.pvr)
>    259			goto out;
>    260	
>    261		if (vcpu->arch.vcore &&
>  > 262			vcpu->arch.vcore->arch_compat == PVR_ARCH_INVALID)
>    263			goto out;
>    264	
>    265		/* PAPR only works with book3s_64 */
>    266		if ((vcpu->arch.cpu_type != KVM_CPU_3S_64) && vcpu->arch.papr_enabled)
>    267			goto out;
>    268	
>    269		/* HV KVM can only do PAPR mode for now */
>    270		if (!vcpu->arch.papr_enabled && is_kvmppc_hv_enabled(vcpu->kvm))
>    271			goto out;
>    272	
> 
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
