Content-Type: multipart/mixed; boundary="===============7765056607279944462=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [RFC PATCH] ima: ima_init_ima_crypto() can be static
Date: Thu, 06 Feb 2020 07:41:20 +0800
Message-ID: <20200205234120.5uoibrojjg66xfpe@f53c9c00458a>
In-Reply-To: <20200205103317.29356-7-roberto.sassu@huawei.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============7765056607279944462==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


Fixes: d49f85a89d4e ("ima: Allocate and initialize tfm for each PCR bank")
Signed-off-by: kbuild test robot <lkp@intel.com>
---
 ima_crypto.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/security/integrity/ima/ima_crypto.c b/security/integrity/ima/i=
ma_crypto.c
index 7b63a32eefea17..d865e26839ef6d 100644
--- a/security/integrity/ima/ima_crypto.c
+++ b/security/integrity/ima/ima_crypto.c
@@ -69,7 +69,7 @@ int ima_num_template_digests;
 =

 static struct ima_algo_desc *ima_algo_array;
 =

-int __init ima_init_ima_crypto(void)
+static int __init ima_init_ima_crypto(void)
 {
 	long rc;
=20
--===============7765056607279944462==--

