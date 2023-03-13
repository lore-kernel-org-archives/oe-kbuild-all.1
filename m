Received: from mx0b-00190b01.pphosted.com (mx0b-00190b01.pphosted.com [67.231.157.127])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 142BD184F
	for <oe-kbuild-all@lists.linux.dev>; Mon, 13 Mar 2023 04:42:10 +0000 (UTC)
Received: from pps.filterd (m0050096.ppops.net [127.0.0.1])
	by m0050096.ppops.net-00190b01. (8.17.1.19/8.17.1.19) with ESMTP id 32CML3Tr031926;
	Mon, 13 Mar 2023 04:17:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=akamai.com; h=from : to : cc :
 subject : date : message-id : in-reply-to; s=jan2016.eng;
 bh=GA0OIMIe/te/tCiaXAMGrHwzfSBwy5TphThL/QXIFNA=;
 b=WOxYekk8gNr98W/vgE398a1QVp+DR4B1g/NBNoJ+snDUiTIclPScpFA2XcXCuOV/o+xk
 BUsG+kV/aUKydp1yfZ2Oe8QeCSg22mklVDPn3+whcsWfRm3ZUcZKnqtbJYdnE1iUbiUS
 0IEmVPjEQGlyOufTxvib6FXhwGzRN+j5YlTQ/DGm80IbVRkDvWoG6pc76VA6eWUKFD1k
 VSPmDYGzKEq45P1Av/m2o/SbfKhAXLKUIe8mK8G29IfJHL+jTFreg9dn4oK0X93dXP4Z
 o1885JaOh+zPrjOL7SSD5dbM5fyLezamdfScqBqc2ef1GPNGH/VeRDA92MeIYlhvcLdD dw== 
Received: from prod-mail-ppoint3 (a72-247-45-31.deploy.static.akamaitechnologies.com [72.247.45.31] (may be forged))
	by m0050096.ppops.net-00190b01. (PPS) with ESMTPS id 3p8jxjfsaa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Mar 2023 04:17:43 +0000
Received: from pps.filterd (prod-mail-ppoint3.akamai.com [127.0.0.1])
	by prod-mail-ppoint3.akamai.com (8.17.1.19/8.17.1.19) with ESMTP id 32D3s96e010477;
	Mon, 13 Mar 2023 00:17:42 -0400
Received: from prod-mail-relay18.dfw02.corp.akamai.com ([172.27.165.172])
	by prod-mail-ppoint3.akamai.com (PPS) with ESMTP id 3p97e454sh-1;
	Mon, 13 Mar 2023 00:17:42 -0400
Received: from bos-lhv9ol.bos01.corp.akamai.com (unknown [172.28.222.101])
	by prod-mail-relay18.dfw02.corp.akamai.com (Postfix) with ESMTP id 6783BFA;
	Mon, 13 Mar 2023 04:17:42 +0000 (GMT)
From: Jason Baron <jbaron@akamai.com>
To: mcgrof@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH] dyndbg: ensure exported functions have a prototype
Date: Mon, 13 Mar 2023 00:17:26 -0400
Message-Id: <20230313041726.155116-1-jbaron@akamai.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <202303111333.Rqs7rhRE-lkp@intel.com>
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-12_10,2023-03-10_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=318 phishscore=0
 malwarescore=0 adultscore=0 bulkscore=0 spamscore=0 suspectscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303130035
X-Proofpoint-GUID: DUvurz_ubGWO_ecO3m6sC_7Q3GTe_5cW
X-Proofpoint-ORIG-GUID: DUvurz_ubGWO_ecO3m6sC_7Q3GTe_5cW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-12_10,2023-03-10_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0 phishscore=0
 mlxlogscore=271 spamscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 mlxscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2303130035
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

After commit 3b5dda5ee141("dyndbg: cleanup dynamic usage in
ib_srp.c"), the exported functions in lib/dynamic_debug.c itself may
not have a prototype if CONFIG_DYNAMIC_DEBUG=n and
CONFIG_DYNAMIC_CORE=y. This can tigger the -Wmissing-prototypes
warning.

The exported functions are behind (include/linux/dynamic_debug.h):

if defined(CONFIG_DYNAMIC_DEBUG) || \
 (defined(CONFIG_DYNAMIC_DEBUG_CORE) && defined(DYNAMIC_DEBUG_MODULE))

Thus, by adding -DDYNAMIC_CONFIG_MODULE to the lib/Makefile we
can ensure that the exported functions have a prototype in all cases,
since lib/dynamic_debug.c is built whenever
CONFIG_DYNAMIC_DEBUG_CORE=y.

CC: Jim Cromie <jim.cromie@gmail.com>
Cc: Luis Chamberlain <mcgrof@kernel.org>
Reported-by: kernel test robot <lkp@intel.com>
Link: https://urldefense.com/v3/__https://lore.kernel.org/oe-kbuild-all/202303111333.Rqs7rhRE-lkp@intel.com/__;!!GjvTz_vk!UY-kgys0XdPUeY6rTX_-r8Bq3Jxd2BsmLVXx_TjSIX5be32flJLNsGMrdGCIZ_Hv-uYrPWM$ 
Signed-off-by: Jason Baron <jbaron@akamai.com>
---
 lib/Makefile | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/lib/Makefile b/lib/Makefile
index baf2821f7a00..7afcd85f78f6 100644
--- a/lib/Makefile
+++ b/lib/Makefile
@@ -231,6 +231,9 @@ lib-$(CONFIG_GENERIC_BUG) += bug.o
 obj-$(CONFIG_HAVE_ARCH_TRACEHOOK) += syscall.o
 
 obj-$(CONFIG_DYNAMIC_DEBUG_CORE) += dynamic_debug.o
+#ensure exported functions have prototypes
+CFLAGS_dynamic_debug.o := -DDYNAMIC_DEBUG_MODULE
+
 obj-$(CONFIG_SYMBOLIC_ERRNAME) += errname.o
 
 obj-$(CONFIG_NLATTR) += nlattr.o
-- 
2.17.1

