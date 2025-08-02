Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C411B1EF09D
	for <oe-kbuild-all@lists.linux.dev>; Sat,  2 Aug 2025 07:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754119804; cv=none; b=SYggky+cDYZWjgoy1w6nlVlB0COGELeXMcLRqA7XHvfC2FYIf7Q8xFOWm6Gn06XKms+Ylld1smZ8MYkTpzg2CMMuKYOG+Bx4QZeOnSfy/KOwPLDSXfaj6sMoZG/MRmT+3ruZTBBJgaXZTThi4XmlcH9mE7H+5tueVjkD3L+FGTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754119804; c=relaxed/simple;
	bh=DIDcBZIkPuJkd9g00xqreI+Dc8V8g6RIIzkmuu9nZ7o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZJKZX/YLxGnqMKqafkfuo1OjLjHTwHcU/V4m0DBNuqeHbVYlYC16uwIylkawhg/WGocz7KI5xBiXsng32/N6/Hw1Q59ch1qkqKJENt6/6n/fChqQOc5TXDtt7q1cjIY4NSn2CWtUMHHE4uxhmbmbe7t/jye7vO9v3z+8O6ii/uw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pZ62GHga; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pZ62GHga"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4561607166aso20309535e9.2
        for <oe-kbuild-all@lists.linux.dev>; Sat, 02 Aug 2025 00:30:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754119801; x=1754724601; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sVqkSmfmXqQYH9ngeJMeDZTbZMYNuXLAMBadZ9U6AGc=;
        b=pZ62GHgaD+6zQrbF2towG0sZBWLj0WXsGHDPfQztIGsQKowHHNKv6pnVQyStZSIaB1
         hWl4wXBkci8rraFArTxDybe8j40G/IgMGuLGzUpBDdrviubyYea/wSzv85uLN4/Zt9qP
         GCLOquiy3zmbijqqT7fjM6Ne+zPltcbveVMIjXO7xQ0h+ClchxDEXJe+XSqpNTN4Acv7
         Xyo+mNIhvxlfgZHjeGNOc5Wr6S7oulqkACVRBCkQdTYINSk0ocr05yG2ru6FneUYzV73
         Qvs3jVFrWwfwET1gjAXPk6hBONQn0H3W8wU05ykZ4mFkff+yx4w4Ini/FdkiTcmABVey
         73MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754119801; x=1754724601;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sVqkSmfmXqQYH9ngeJMeDZTbZMYNuXLAMBadZ9U6AGc=;
        b=cOaBMaalf36ZZOFF9XaxnXZBxTHguQyxSR+kuf8/4Q9YlZTg1UBOchjhp6Rs+1fwVI
         +6k4Qa4LG+FWwtnJEop/ye4yN3o/eMx/k5dad8KjVSynSBrVrLccJUa5DTLv8TOVeo0E
         rgWqg/dpPUwg4h5CYTkzueaX/90qr2b8v05pGzII/1d4NGY3PW/uQy+/b4bdEacbovy6
         h1+KhmmonsT1nmQ7OP/K2Rt0rLrYkpSrNGs1NhhDbUpUbFoPkenLnBTBsIzEz8gTB7XY
         2LKe/SJ8E17i39HL7BE07PiTqi35W4E0Me4If1LbsilZ1z3cWM97mCnQxNMeK3xILRpA
         gv7Q==
X-Forwarded-Encrypted: i=1; AJvYcCViXhxSzCb2qEua1A5gc0p5mB1f52sSHJNDdf/72rmpv6kiYYdW5MZfdiZoyJgUxHd+YjiSmRH//ykoKXiY@lists.linux.dev
X-Gm-Message-State: AOJu0YwZBKRDAT7lnq8H14ftYL/Km7kcEPfF476qeAI3D0Ax4YhVV7Mi
	gtIZP52ko22f5YBUhihqy6rdl86mg2DHdO1riMfbo9rMXT29PaY0k0RUnFBL1cjNUsw=
X-Gm-Gg: ASbGncvJEi2BxZwUJEJySefXt/cMho9zLJ8meridnvGqIe1bhQo5FvxYDU3/Q/7ztjG
	kpY617pjCiooi9JB/JssNq+kPhGEUZJwMXdrcjmJzGgCQ4QfGvTQh611uL37r7A9htoyaBpNhaK
	hkkZ+ocoULM8vsOdE+GoR6JVemE9sCPGqhgZk8jbd5u9X/Ix1bSyIa7+Bs7JhWEB5yYj+NMw7bp
	VSbSwwXZN3lfjeWu9yUzBagAgrxJAfL2UmZiP3e/gvHQ/E956HY6FmbDxiR+2a7+ZU/tfhqrqnE
	Lk9g5dEobyC++jbFpGR6JZ695Wfif8FBIS3Ev4Srnjfa0X79SwPjOtJwBk4EQ+FwdoLwoR0k+xb
	f8c7EqDnVY9rTwiDLkVdkHOiq9tc=
X-Google-Smtp-Source: AGHT+IF8KvCsCjeTEyKbXPId3ohQmFPUY38d88zx4FQsCO/4ZoZFs0jr0FAKcWT1QAALg5TjCmnVhA==
X-Received: by 2002:a05:600c:4692:b0:456:1a69:94fa with SMTP id 5b1f17b1804b1-458b69dd831mr13148315e9.13.1754119800883;
        Sat, 02 Aug 2025 00:30:00 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c47ca5fsm8119453f8f.63.2025.08.02.00.29.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Aug 2025 00:30:00 -0700 (PDT)
Date: Sat, 2 Aug 2025 10:29:57 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Kent Overstreet <kent.overstreet@linux.dev>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 12911/13054] fs/bcachefs/snapshot.c:1149
 bch2_snapshot_node_delete() warn: missing error code? 'ret'
Message-ID: <8dc19809-7a3a-427f-be4e-bec7a76b4bfd@suswa.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   b9ddaa95fd283bce7041550ddbbe7e764c477110
commit: 24c5e7ab4066da2073d1c50e82308c8bc0ec4ec3 [12911/13054] bcachefs: Convert bch2_bkey_get_mut() to CLASS(btree_iter)
config: parisc-randconfig-r071-20250801 (https://download.01.org/0day-ci/archive/20250802/202508020434.RgnHwchO-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 15.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202508020434.RgnHwchO-lkp@intel.com/

smatch warnings:
fs/bcachefs/snapshot.c:1149 bch2_snapshot_node_delete() warn: missing error code? 'ret'

vim +/ret +1149 fs/bcachefs/snapshot.c

96dea3d599dbc3 Kent Overstreet 2023-09-12  1110  static int bch2_snapshot_node_delete(struct btree_trans *trans, u32 id)
8e877caaad8185 Kent Overstreet 2023-08-16  1111  {
8e877caaad8185 Kent Overstreet 2023-08-16  1112  	struct bch_fs *c = trans->c;
f55d6e07bc6c9b Kent Overstreet 2023-08-17  1113  	u32 parent_id, child_id;
8e877caaad8185 Kent Overstreet 2023-08-16  1114  	unsigned i;
8e877caaad8185 Kent Overstreet 2023-08-16  1115  
e9756dd29f33ed Kent Overstreet 2025-05-02  1116  	struct bkey_i_snapshot *s =
24c5e7ab4066da Kent Overstreet 2025-07-31  1117  		bch2_bkey_get_mut_typed(trans, BTREE_ID_snapshots, POS(0, id), 0, snapshot);
24c5e7ab4066da Kent Overstreet 2025-07-31  1118  	int ret = PTR_ERR_OR_ZERO(s);
8e877caaad8185 Kent Overstreet 2023-08-16  1119  	bch2_fs_inconsistent_on(bch2_err_matches(ret, ENOENT), c,
8e877caaad8185 Kent Overstreet 2023-08-16  1120  				"missing snapshot %u", id);
8e877caaad8185 Kent Overstreet 2023-08-16  1121  
8e877caaad8185 Kent Overstreet 2023-08-16  1122  	if (ret)
24c5e7ab4066da Kent Overstreet 2025-07-31  1123  		return ret;
8e877caaad8185 Kent Overstreet 2023-08-16  1124  
e9756dd29f33ed Kent Overstreet 2025-05-02  1125  	BUG_ON(BCH_SNAPSHOT_DELETED(&s->v));
e9756dd29f33ed Kent Overstreet 2025-05-02  1126  	BUG_ON(s->v.children[1]);
f55d6e07bc6c9b Kent Overstreet 2023-08-17  1127  
e9756dd29f33ed Kent Overstreet 2025-05-02  1128  	parent_id = le32_to_cpu(s->v.parent);
e9756dd29f33ed Kent Overstreet 2025-05-02  1129  	child_id = le32_to_cpu(s->v.children[0]);
8e877caaad8185 Kent Overstreet 2023-08-16  1130  
8e877caaad8185 Kent Overstreet 2023-08-16  1131  	if (parent_id) {
24c5e7ab4066da Kent Overstreet 2025-07-31  1132  		struct bkey_i_snapshot *parent =
24c5e7ab4066da Kent Overstreet 2025-07-31  1133  			bch2_bkey_get_mut_typed(trans, BTREE_ID_snapshots, POS(0, parent_id),
8e877caaad8185 Kent Overstreet 2023-08-16  1134  						0, snapshot);
8e877caaad8185 Kent Overstreet 2023-08-16  1135  		ret = PTR_ERR_OR_ZERO(parent);
8e877caaad8185 Kent Overstreet 2023-08-16  1136  		bch2_fs_inconsistent_on(bch2_err_matches(ret, ENOENT), c,
8e877caaad8185 Kent Overstreet 2023-08-16  1137  					"missing snapshot %u", parent_id);
f55d6e07bc6c9b Kent Overstreet 2023-08-17  1138  		if (unlikely(ret))
24c5e7ab4066da Kent Overstreet 2025-07-31  1139  			return ret;
8e877caaad8185 Kent Overstreet 2023-08-16  1140  
f55d6e07bc6c9b Kent Overstreet 2023-08-17  1141  		/* find entry in parent->children for node being deleted */
8e877caaad8185 Kent Overstreet 2023-08-16  1142  		for (i = 0; i < 2; i++)
8e877caaad8185 Kent Overstreet 2023-08-16  1143  			if (le32_to_cpu(parent->v.children[i]) == id)
8e877caaad8185 Kent Overstreet 2023-08-16  1144  				break;
8e877caaad8185 Kent Overstreet 2023-08-16  1145  
f55d6e07bc6c9b Kent Overstreet 2023-08-17  1146  		if (bch2_fs_inconsistent_on(i == 2, c,
f55d6e07bc6c9b Kent Overstreet 2023-08-17  1147  					"snapshot %u missing child pointer to %u",
f55d6e07bc6c9b Kent Overstreet 2023-08-17  1148  					parent_id, id))
24c5e7ab4066da Kent Overstreet 2025-07-31 @1149  			return ret;

This returns success but it looks like the intention was to return an
error code.

8e877caaad8185 Kent Overstreet 2023-08-16  1150  
0a11adfb7aceb6 Kent Overstreet 2023-11-11  1151  		parent->v.children[i] = cpu_to_le32(child_id);
f55d6e07bc6c9b Kent Overstreet 2023-08-17  1152  
f55d6e07bc6c9b Kent Overstreet 2023-08-17  1153  		normalize_snapshot_child_pointers(&parent->v);
f55d6e07bc6c9b Kent Overstreet 2023-08-17  1154  	}
f55d6e07bc6c9b Kent Overstreet 2023-08-17  1155  
f55d6e07bc6c9b Kent Overstreet 2023-08-17  1156  	if (child_id) {
24c5e7ab4066da Kent Overstreet 2025-07-31  1157  		struct bkey_i_snapshot *child =
24c5e7ab4066da Kent Overstreet 2025-07-31  1158  			bch2_bkey_get_mut_typed(trans, BTREE_ID_snapshots, POS(0, child_id),
f55d6e07bc6c9b Kent Overstreet 2023-08-17  1159  						0, snapshot);
f55d6e07bc6c9b Kent Overstreet 2023-08-17  1160  		ret = PTR_ERR_OR_ZERO(child);
f55d6e07bc6c9b Kent Overstreet 2023-08-17  1161  		bch2_fs_inconsistent_on(bch2_err_matches(ret, ENOENT), c,
f55d6e07bc6c9b Kent Overstreet 2023-08-17  1162  					"missing snapshot %u", child_id);
f55d6e07bc6c9b Kent Overstreet 2023-08-17  1163  		if (unlikely(ret))
24c5e7ab4066da Kent Overstreet 2025-07-31  1164  			return ret;
f55d6e07bc6c9b Kent Overstreet 2023-08-17  1165  
f55d6e07bc6c9b Kent Overstreet 2023-08-17  1166  		child->v.parent = cpu_to_le32(parent_id);
f55d6e07bc6c9b Kent Overstreet 2023-08-17  1167  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

