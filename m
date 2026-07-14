Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D814B33D6C7
	for <oe-kbuild-all@lists.linux.dev>; Tue, 14 Jul 2026 18:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784052142; cv=none; b=BhGh1SQiHATusLkHjzLWBexxPDzt2rQbrHHACA9sQsm16Cu4trPISebT4Ch5rymQVKZA3dEx01QtAEtVPhBkFlFiYRyO0uMC5zhQpeodYzUdL8lvkxTRDBJtTdCZ69MfMxk6DxeZOGZFMIyjoa2xIvJ7BEErpweqmGjOOsRzxXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784052142; c=relaxed/simple;
	bh=P9xu/RkjxNPqcJk7ZgpNGiYr9rRRj5ya+7R/tccFWpw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sAFpW8BKng+fU0DqIhMBK6VtSf+Gw/dbKDJcQQ8fd3k1CxOrXMtcUPhfII5AYbwSMCsw4B0oaIf2qPD/GnK4ktvSPu5LhF4Ug2vo1DLgTHKgrzquW1gHWBw7eauWS/R6VhqDFh42QzLkG0gCi8gBO5ZOl0mbDwpAiggoznvuGzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=Mx3SEoZR; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="Mx3SEoZR"
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66EGBcTo4103601;
	Tue, 14 Jul 2026 18:02:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=8zgo9L
	gy+Lmi+OhBUKT7lvJYvqCjyM86L0Y7/9V2q40=; b=Mx3SEoZR+Rg03qp+lSSJwH
	ZX/l7dBMfa5/5HXQ8oxH4i9EeoXDNSiZeoEsZ2guO60V3WNnrjrUa+Di61LPyn5n
	95NDhud0E6/oFyrNVsfoKtazjYDpdORu+nsyNme8KfUnfolVWZr4EU9P5OXTLSFu
	MNnOanVbhrz9iF1t3LWXyOUT40N/+0erL6YaqlgJ35CZnDAElCsei2tgoqsudOu+
	W6kADYJHwVTH5iqBeFHBgK9ucUlgTG1oD99dXEnrNihz0zKR6wxOajCMosEm3LAA
	6zMH3UwV/omFbWN3aFtaIIhZx1bUVUYrOoTiNXY2wfmPGXrdPUUwYFz+0b1Fmamg
	==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4fcv33859y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Jul 2026 18:02:18 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 66EHnbS3017422;
	Tue, 14 Jul 2026 18:02:18 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4fc2cgbub1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Jul 2026 18:02:18 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 66EI2ERa57606580
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 14 Jul 2026 18:02:14 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 67AA420049;
	Tue, 14 Jul 2026 18:02:14 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D913C20040;
	Tue, 14 Jul 2026 18:02:12 +0000 (GMT)
Received: from fedora (unknown [9.5.7.39])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Tue, 14 Jul 2026 18:02:12 +0000 (GMT)
Date: Tue, 14 Jul 2026 23:32:30 +0530
From: Amit Machhiwal <amachhiw@linux.ibm.com>
To: kernel test robot <lkp@intel.com>
Cc: Amit Machhiwal <amachhiw@linux.ibm.com>, oe-kbuild-all@lists.linux.dev,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Vaibhav Jain <vaibhav@linux.ibm.com>,
        "Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>,
        "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Subject: Re: [linuxppc:merge-test 8/10] arch/powerpc/kvm/powerpc.c:262:33:
 error: invalid use of undefined type 'struct kvmppc_vcore'
Message-ID: <20260714232628.7450c9ea-1b-amachhiw@linux.ibm.com>
References: <202607142107.CrgQhmsx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <202607142107.CrgQhmsx-lkp@intel.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDE4MyBTYWx0ZWRfX6TWB7JcrELFQ
 bI6Je4DUWW21RPxYkLXgUyqarWBHGGK/PiRRqU07sEINeASYX1nxxtntSyH4eN6pymhc1sh6u4X
 MaiN633y6426qq+x5xpv/0Dnb/4Sd5g=
X-Authority-Analysis: v=2.4 cv=Mp1iLWae c=1 sm=1 tr=0 ts=6a5679ab cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=uAbxVGIbfxUO_5tXvNgY:22 a=NEAV23lmAAAA:8
 a=i3X5FwGiAAAA:8 a=QyXUC8HyAAAA:8 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8
 a=nHU8jTWHvS3xWWdE_vkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=mmqRlSCDY2ywfjPLJ4af:22
X-Proofpoint-GUID: PlBQQ7cmSHGbu7rjhwhBUSarLfljjZla
X-Proofpoint-ORIG-GUID: k_nbbws-nsxym6od0sCQ09rwhVWGRw58
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDE4MyBTYWx0ZWRfX7lVduCdcwgRQ
 Qh+idHzwnSnBoqvIpToUES4LeimEOaxsHyNenQSeLEExGuJBJ7XcQdC9NJCeTtE8G95eEbDpsEi
 HvPdjCEO2mlS/jphXCcY6iKKLU5ZJtg39lZSQM/c4Zao4vYXGOy0jgjYsBygm4n6Ob9zbeFWaQd
 Crmwj9V4HIjOIkNa4rJoN3xecQNg6KS20QRwOrb8+awVTYn/qLErnbcX81JdOv0AgbfMOYTSCWe
 FjgrkEcfLnCEQ5Hx1CQ6X+0oMkT8SzLC07HUWCJTZnU/S7QyaezOepUqxsYgCVeE9f2quBGf2TR
 I35R767DwwmF3wYQhMv6o+XM9UxxLAnHjPuGwbCC2goRV0t7RZr/FT4GbsLr3/dt2DMZOtQIPO3
 NvJ3An1Ny45i3e24Uel79u/Ba4a8kpLlIMHoSsS+fXg9i8xH0084tMrAvhxpqEmxeeIM6/5JuKZ
 WOvTgnD+gdiwe5SJTyA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_04,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 impostorscore=0 priorityscore=1501 suspectscore=0 clxscore=1011 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140183

On 2026/07/14 09:47 PM, kernel test robot wrote:
> tree:   https://github.com/linuxppc/linux merge-test
> head:   3ca739706580462a132d3a0706e801d9893aaa9e
> commit: a7452640914469676b5fcffee80ee045525bddb8 [8/10] KVM: PPC: Book3S HV: Validate arch_compat against host compatibility mode
> config: powerpc64-randconfig-002-20260713 (https://download.01.org/0day-ci/archive/20260714/202607142107.CrgQhmsx-lkp@intel.com/config)
> compiler: powerpc64-linux-gcc (GCC) 13.4.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260714/202607142107.CrgQhmsx-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202607142107.CrgQhmsx-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    arch/powerpc/kvm/powerpc.c: In function 'kvmppc_sanity_check':
> >> arch/powerpc/kvm/powerpc.c:262:33: error: invalid use of undefined type 'struct kvmppc_vcore'
>      262 |                 vcpu->arch.vcore->arch_compat == PVR_ARCH_INVALID)
>          |                                 ^~

[...]

Thanks for the report and catching this. The config
"powerpc64-randconfig-002-20260713" has the below KVM configs set:

  ╰─❯ cat config | grep KVM
  # CONFIG_KVM_GUEST is not set
  CONFIG_KVM_COMMON=y
  CONFIG_HAVE_KVM_IRQCHIP=y
  CONFIG_HAVE_KVM_IRQ_ROUTING=y
  CONFIG_KVM_MMIO=y
  CONFIG_HAVE_KVM_MSI=y
  CONFIG_KVM_VFIO=y
  CONFIG_KVM_COMPAT=y
  CONFIG_HAVE_KVM_IRQ_BYPASS=y
  CONFIG_KVM=y
  CONFIG_KVM_BOOKE_HV=y
  CONFIG_KVM_EXIT_TIMING=y
  CONFIG_KVM_E500MC=y
  CONFIG_KVM_MPIC=y

This is a BookE config without CONFIG_PPC_BOOK3S, so struct kvmppc_vcore
is never fully defined (it comes in via kvm_book3s.h which is only
included when CONFIG_PPC_BOOK3S is set). The dereference of
vcore->arch_compat therefore fails to compile.

Posted v5 fixing it here:

  https://lore.kernel.org/all/20260714175432.86388-1-amachhiw@linux.ibm.com/

Thanks,
Amit

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
>    269		/* HV KVM can only do PAPR mode for now */ >    270		if (!vcpu->arch.papr_enabled && is_kvmppc_hv_enabled(vcpu->kvm))
>    271			goto out;
>    272	
> 
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
