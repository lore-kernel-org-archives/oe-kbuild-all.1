Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 853F47472
	for <oe-kbuild-all@lists.linux.dev>; Fri, 19 May 2023 10:46:33 +0000 (UTC)
Received: from pps.filterd (m0353727.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34JAaoq6011402;
	Fri, 19 May 2023 10:45:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=+R9wgVfW9FU1IOMOrmlAdO0cWWrC63jVeDDzsfNkOO0=;
 b=G2YFqxCXp3ygPkyXHYLsTV44FaexVg2zWQQkuw0BKAuPEfICill7w0b35wXC07ScQt/z
 i9jd7dAx8Zfjg4f8JdfwquXBPlAlKcfY5LT56yi1R8M0g4mPHGALoqNyM1q3gLOups0E
 MTDuKH8OmHAr/A0woxbWJ4SIpRajcMDtExMfoial4ox8rA8Yu00mrMrKrsO3z+TrzbMA
 DYqggX8DQq2OPs2c949hQen1xPPgy+YJObrc8wZvGbC3dZtFfpyO7X1BtJr075sWidfl
 dxdBv7tD4iYhmkVcXYyLz2UEiCp+QWd9lPO/7IUMxo4POigLbRPGpHxS6yiFxyQqGIMj WQ== 
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com [159.122.73.72])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qp4xxvs9c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 19 May 2023 10:45:58 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
	by ppma06fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 34J7a9BS028598;
	Fri, 19 May 2023 10:45:55 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma06fra.de.ibm.com (PPS) with ESMTPS id 3qj1tdtk6j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 19 May 2023 10:45:55 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 34JAjr2s36962682
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 19 May 2023 10:45:53 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 357182004B;
	Fri, 19 May 2023 10:45:53 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DA4CC20043;
	Fri, 19 May 2023 10:45:52 +0000 (GMT)
Received: from [9.171.0.172] (unknown [9.171.0.172])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 19 May 2023 10:45:52 +0000 (GMT)
Message-ID: <6970167d6e50374cfbcd6f16b2eba88ec7152cbd.camel@linux.ibm.com>
Subject: Re: [niks:has_ioport_v4 36/41] drivers/usb/host/xhci.c:604:
 undefined reference to `usb_amd_dev_put'
From: Niklas Schnelle <schnelle@linux.ibm.com>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Arnd Bergmann <arnd@kernel.org>
Date: Fri, 19 May 2023 12:45:52 +0200
In-Reply-To: <202305170043.VH0y8VVp-lkp@intel.com>
References: <202305170043.VH0y8VVp-lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.48.1 (3.48.1-1.fc38) 
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Dfk82i1c2G-jS1N0CX0YRVeNNXgudOXc
X-Proofpoint-ORIG-GUID: Dfk82i1c2G-jS1N0CX0YRVeNNXgudOXc
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-19_06,2023-05-17_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 spamscore=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 phishscore=0 clxscore=1015
 mlxlogscore=592 bulkscore=0 malwarescore=0 mlxscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2304280000
 definitions=main-2305190089

On Wed, 2023-05-17 at 00:52 +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/niks/linux.git ha=
s_ioport_v4
> head:   2756ddc442d6049bedb385767f95bd7b7d7208e1
> commit: 6b3a0c574563b73e12d607bdf632cd3b7e63358a [36/41] usb: pci-quirks:=
 handle HAS_IOPORT dependencies
> config: i386-randconfig-a013-20230515
> compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
> reproduce (this is a W=3D1 build):
>         # https://git.kernel.org/pub/scm/linux/kernel/git/niks/linux.git/=
commit/?id=3D6b3a0c574563b73e12d607bdf632cd3b7e63358a
>         git remote add niks https://git.kernel.org/pub/scm/linux/kernel/g=
it/niks/linux.git
>         git fetch --no-tags niks has_ioport_v4
>         git checkout 6b3a0c574563b73e12d607bdf632cd3b7e63358a
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         make W=3D1 O=3Dbuild_dir ARCH=3Di386 olddefconfig
>         make W=3D1 O=3Dbuild_dir ARCH=3Di386 SHELL=3D/bin/bash
>=20
> If you fix the issue, kindly add following tag where applicable
> > Reported-by: kernel test robot <lkp@intel.com>
> > Link: https://lore.kernel.org/oe-kbuild-all/202305170043.VH0y8VVp-lkp@i=
ntel.com/
>=20

Missed the dependency on USB_PCI for the new USB_PCI_AMD. Added for v5.

