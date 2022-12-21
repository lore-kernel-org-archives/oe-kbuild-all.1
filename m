Received: from formenos.hmeau.com (helcar.hmeau.com [216.24.177.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E7B51FA7
	for <oe-kbuild-all@lists.linux.dev>; Wed, 21 Dec 2022 06:58:21 +0000 (UTC)
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.94.2 #2 (Debian))
	id 1p7t3I-0098Bf-9y; Wed, 21 Dec 2022 14:58:09 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Wed, 21 Dec 2022 14:58:08 +0800
Date: Wed, 21 Dec 2022 14:58:08 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Eric Biggers <ebiggers@kernel.org>
Cc: "Chen, Rong A" <rong.a.chen@intel.com>,
	kernel test robot <lkp@intel.com>,
	"Jason A. Donenfeld" <zx2c4@kernel.org>,
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Linux Crypto Mailing List <linux-crypto@vger.kernel.org>
Subject: [v2 PATCH] crypto: lib/blake2s - Split up test function to halve
 stack usage
Message-ID: <Y6KugNpLeAC00nvy@gondor.apana.org.au>
References: <202211072109.qvrnjNKo-lkp@intel.com>
 <Y5Flnb8jadyDebx3@gondor.apana.org.au>
 <d25ac395-4335-be88-9dc5-364f5715554f@intel.com>
 <Y5V3JUL+r4k/XrL9@gondor.apana.org.au>
 <Y6IcSgmXpGwWP+xK@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y6IcSgmXpGwWP+xK@gmail.com>

On Tue, Dec 20, 2022 at 08:34:18PM +0000, Eric Biggers wrote:
>
> Shouldn't these functions have 'noinline_for_stack' added to them?

Indeed they should.  Thanks!

---8<---
Reduce the stack usage further by splitting up the test function.

Also squash blocks and unaligned_blocks into one array.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Herbert Xu <herbert@gondor.apana.org.au>

diff --git a/lib/crypto/blake2s-selftest.c b/lib/crypto/blake2s-selftest.c
index 7d77dea15587..d0634ed6a937 100644
--- a/lib/crypto/blake2s-selftest.c
+++ b/lib/crypto/blake2s-selftest.c
@@ -545,7 +545,7 @@ static const u8 blake2s_testvecs[][BLAKE2S_HASH_SIZE] __initconst = {
     0xd6, 0x98, 0x6b, 0x07, 0x10, 0x65, 0x52, 0x65, },
 };
 
-bool __init blake2s_selftest(void)
+static bool __init noinline_for_stack blake2s_digest_test(void)
 {
 	u8 key[BLAKE2S_KEY_SIZE];
 	u8 buf[ARRAY_SIZE(blake2s_testvecs)];
@@ -589,11 +589,20 @@ bool __init blake2s_selftest(void)
 		}
 	}
 
+	return success;
+}
+
+static bool __init noinline_for_stack blake2s_random_test(void)
+{
+	struct blake2s_state state;
+	bool success = true;
+	int i, l;
+
 	for (i = 0; i < 32; ++i) {
 		enum { TEST_ALIGNMENT = 16 };
-		u8 unaligned_block[BLAKE2S_BLOCK_SIZE + TEST_ALIGNMENT - 1]
+		u8 blocks[BLAKE2S_BLOCK_SIZE * 2 + TEST_ALIGNMENT - 1]
 					__aligned(TEST_ALIGNMENT);
-		u8 blocks[BLAKE2S_BLOCK_SIZE * 2];
+		u8 *unaligned_block = blocks + BLAKE2S_BLOCK_SIZE;
 		struct blake2s_state state1, state2;
 
 		get_random_bytes(blocks, sizeof(blocks));
@@ -630,3 +639,13 @@ bool __init blake2s_selftest(void)
 
 	return success;
 }
+
+bool __init blake2s_selftest(void)
+{
+	bool success;
+
+	success = blake2s_digest_test();
+	success &= blake2s_random_test();
+
+	return success;
+}
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
