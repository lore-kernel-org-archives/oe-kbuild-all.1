Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0452D7C
	for <oe-kbuild-all@lists.linux.dev>; Wed, 16 Nov 2022 00:44:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1668559445; x=1700095445;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=3bqLkNfBeyVu6ZozHb3GDCMkCiQN1T0vQC8Er0Ni6co=;
  b=UVB3p91GPs8YCsGoxbsAkHgaQkzozpL0I81KjQf+mJKdswGPsYi2vQ0a
   9AhQ/ND1nT3+yNcxAofS+BNweMX2lZ7ITf65xYE7LZDkV3NOrTZhjf2CJ
   Frak6Lz1LIVRLWn+wDMgr5DNtdzcdOceiKsp/UAYmODs681noZCRp1xKP
   Q7stNp6rkENvZdpyRGJ3UyhL7Byi8/a6ExlItVA0zm0c9ZwO8sz5EMWZa
   g1UFaOXkRwjYewORMSAaK6p8fGiDL7fux+8baUSRlGW6IZIEuRANhvT43
   UFMQWiOuN2K6FdST+1uth+Q399J/zxREFl4llrdjUpw3uE+i4mEp6SJag
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10532"; a="311116307"
X-IronPort-AV: E=Sophos;i="5.96,167,1665471600"; 
   d="scan'208";a="311116307"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2022 16:44:04 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10532"; a="968210386"
X-IronPort-AV: E=Sophos;i="5.96,167,1665471600"; 
   d="scan'208";a="968210386"
Received: from nrobin-mobl.ger.corp.intel.com (HELO box.shutemov.name) ([10.249.45.56])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2022 16:44:01 -0800
Received: by box.shutemov.name (Postfix, from userid 1000)
	id 125161042A8; Wed, 16 Nov 2022 03:43:59 +0300 (+03)
From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
To: kirill@shutemov.name
Cc: dave.hansen@intel.com,
	dave.hansen@linux.intel.com,
	jejb@linux.ibm.com,
	kirill.shutemov@linux.intel.com,
	linux-kernel@vger.kernel.org,
	lkp@intel.com,
	martin.petersen@oracle.com,
	oe-kbuild-all@lists.linux.dev,
	x86@kernel.org
Subject: [PATCH 0/2] x86/mm: Fix sparse warning due to LAM patchset
Date: Wed, 16 Nov 2022 03:43:51 +0300
Message-Id: <20221116004353.15052-1-kirill.shutemov@linux.intel.com>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20221115155802.p3vjnk7eqqcyskt3@box.shutemov.name>
References: <20221115155802.p3vjnk7eqqcyskt3@box.shutemov.name>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

LKP reported new warnings due to LAM patchset.

Fix them.

Kirill A. Shutemov (2):
  scsi: Fix get_user() in call sg_scsi_ioctl()
  x86/mm: Fix sparse warnings in untagged_ptr()

 arch/x86/include/asm/uaccess.h | 10 +++-------
 drivers/scsi/scsi_ioctl.c      |  2 +-
 2 files changed, 4 insertions(+), 8 deletions(-)

-- 
2.38.0

