Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77A583B7BB
	for <oe-kbuild-all@lists.linux.dev>; Mon, 11 Dec 2023 12:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0010AFEC;
	Mon, 11 Dec 2023 04:54:21 -0800 (PST)
Received: from e125769.cambridge.arm.com (e125769.cambridge.arm.com [10.1.196.26])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 934533F762;
	Mon, 11 Dec 2023 04:53:33 -0800 (PST)
From: Ryan Roberts <ryan.roberts@arm.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Ryan Roberts <ryan.roberts@arm.com>,
	kernel test robot <lkp@intel.com>,
	oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Barry Song <v-songbaohua@oppo.com>
Subject: [PATCH] mm: thp: Fix build warning when CONFIG_SYSFS is disabled
Date: Mon, 11 Dec 2023 12:53:20 +0000
Message-Id: <20231211125320.3997543-1-ryan.roberts@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <202312111916.YbsHxKPq-lkp@intel.com>
References: <202312111916.YbsHxKPq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

huge_anon_orders_lock is used only to serialize sysfs writers. So move
its definition so that it is within the CONFIG_SYSFS ifdefery to
suppress "defined but not used" warning when sysfs is disabled.

Fixes: fe2c9313a8c0 ("mm: thp: Introduce multi-size THP sysfs interface")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202312111916.YbsHxKPq-lkp@intel.com/
Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
---

Hi Andrew,

David mentioned that your preference is to squash minor fixes into patches in
mm-unstable? Could you please squash this into commit fe2c9313a8c0 ("mm: thp:
Introduce multi-size THP sysfs interface")?

Thanks,
Ryan

 mm/huge_memory.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index cfb1d04a71b1..ddf73422d3b5 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -77,7 +77,6 @@ unsigned long huge_zero_pfn __read_mostly = ~0UL;
 unsigned long huge_anon_orders_always __read_mostly;
 unsigned long huge_anon_orders_madvise __read_mostly;
 unsigned long huge_anon_orders_inherit __read_mostly;
-static DEFINE_SPINLOCK(huge_anon_orders_lock);

 unsigned long __thp_vma_allowable_orders(struct vm_area_struct *vma,
 					 unsigned long vm_flags, bool smaps,
@@ -442,6 +441,7 @@ static const struct attribute_group hugepage_attr_group = {

 static void hugepage_exit_sysfs(struct kobject *hugepage_kobj);
 static void thpsize_release(struct kobject *kobj);
+static DEFINE_SPINLOCK(huge_anon_orders_lock);
 static LIST_HEAD(thpsize_list);

 struct thpsize {
--
2.25.1

