Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5E0B629
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 May 2023 14:56:01 +0000 (UTC)
Received: from pps.filterd (m0353727.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34BEls7Q020193;
	Thu, 11 May 2023 14:55:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=Sj9pajivdM+uzML4kLBdLjbMi8F3AWfRGQg6/Vqf6R0=;
 b=iQ5ffTwkXoW64FVv2jL4h66P5QaiqwaGPqTo+9U0SFluzwp1UMJcTpSEUdk+92Ez18lN
 R/whmrY8v9OGZ5F5THadOU3u4wmLzOWkG7Husn7o/G5cGFdC6UnRWOtM5YuUR1ksMEiH
 afgfoYe0uH79OG309oOQ3zRmMmxhBIM8aPM1BP8k5j72zImJWElF9gT+5noEHOvOstzw
 cqjQHygsV+Se8bCN+lE+aiMmSsz5NCfm5beb2SF5wp+KQd1zmhPSFiIKhnc2KL7JbHuC
 HbiTMv2/bC8oCs1fxA7jehn9aKnYEw0+g6W/5xEzRZsOolB97e+1hYWnG+WKJop8t4ko 9g== 
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com [149.81.74.108])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qh1n8j4va-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 May 2023 14:55:51 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
	by ppma05fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 34BD9x7i020159;
	Thu, 11 May 2023 14:33:58 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma05fra.de.ibm.com (PPS) with ESMTPS id 3qf7mhhf31-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 May 2023 14:33:57 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 34BEXt9B66781538
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 11 May 2023 14:33:55 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7171E20043;
	Thu, 11 May 2023 14:33:55 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 33CB520040;
	Thu, 11 May 2023 14:33:55 +0000 (GMT)
Received: from [9.171.55.60] (unknown [9.171.55.60])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 11 May 2023 14:33:55 +0000 (GMT)
Message-ID: <255e20c534e74a2ad93ef7e32325b7eb865f61ba.camel@linux.ibm.com>
Subject: Re: [niks:has_ioport_v4 36/41] drivers/usb/host/xhci-hub.c:1805:37:
 error: implicit declaration of function 'usb_amd_pt_check_port'
From: Niklas Schnelle <schnelle@linux.ibm.com>
To: kernel test robot <lkp@intel.com>, Arnd Bergmann <arnd@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Date: Thu, 11 May 2023 16:33:54 +0200
In-Reply-To: <202305112044.901Gb35D-lkp@intel.com>
References: <202305112044.901Gb35D-lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.48.1 (3.48.1-1.fc38) 
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: PrZdBIzS0Hl6HWLL1V_7YOeZ9V4x6FKl
X-Proofpoint-GUID: PrZdBIzS0Hl6HWLL1V_7YOeZ9V4x6FKl
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-11_11,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 bulkscore=0
 mlxlogscore=838 lowpriorityscore=0 spamscore=0 phishscore=0 adultscore=0
 clxscore=1015 impostorscore=0 suspectscore=0 priorityscore=1501 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2304280000
 definitions=main-2305110125

On Thu, 2023-05-11 at 20:41 +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/niks/linux.git ha=
s_ioport_v4
> head:   7591a40aebcc68208650e4324799df61bed47bb4
> commit: 96ffabef0a84bae16aff7e26ac08322a27358e1b [36/41] usb: pci-quirks:=
 handle HAS_IOPORT dependencies
> config: mips-allmodconfig (https://download.01.org/0day-ci/archive/202305=
11/202305112044.901Gb35D-lkp@intel.com/config)
> compiler: mips-linux-gcc (GCC) 12.1.0
> reproduce (this is a W=3D1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://git.kernel.org/pub/scm/linux/kernel/git/niks/linux.git/=
commit/?id=3D96ffabef0a84bae16aff7e26ac08322a27358e1b
>         git remote add niks https://git.kernel.org/pub/scm/linux/kernel/g=
it/niks/linux.git
>         git fetch --no-tags niks has_ioport_v4
>         git checkout 96ffabef0a84bae16aff7e26ac08322a27358e1b
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 make.cro=
ss W=3D1 O=3Dbuild_dir ARCH=3Dmips olddefconfig
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 make.cro=
ss W=3D1 O=3Dbuild_dir ARCH=3Dmips SHELL=3D/bin/bash drivers/usb/host/
>=20
> If you fix the issue, kindly add following tag where applicable
> > Reported-by: kernel test robot <lkp@intel.com>
> > Link: https://lore.kernel.org/oe-kbuild-all/202305112044.901Gb35D-lkp@i=
ntel.com/
>=20
> All errors (new ones prefixed by >>):
>=20
>    drivers/usb/host/xhci-hub.c: In function 'xhci_bus_suspend':
> > > drivers/usb/host/xhci-hub.c:1805:37: error: implicit declaration of f=
unction 'usb_amd_pt_check_port' [-Werror=3Dimplicit-function-declaration]
>     1805 |                                 if (usb_amd_pt_check_port(hcd-=
>self.controller,
>          |                                     ^~~~~~~~~~~~~~~~~~~~~
>    cc1: some warnings being treated as errors
>=20

Ok, since I obviously forgot another declaration in pci-quirks.h I now
checked all of the non-static functions conditional on
CONFIG_USB_PCI_AMD manually. With my current state plus the above fixed
all except for usb_hcd_amd_remote_wakeup_quirk() have a prototype and a
stub in pci-quirks.h. So I'm thinking if I provide a stub for
usb_hcd_amd_remote_wakeup_quirk() that just returns 0 I can get rid of
the #ifdef CONFIG_USB_PCI_AMD in hcd-pci.c and have all of them easily
checkable. So did that.

Thanks,
Niklas
