Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04E7012B171
	for <oe-kbuild-all@lists.linux.dev>; Thu, 23 May 2024 14:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716475226; cv=none; b=sgJsc8itXXZJZdZgv3T8KwoLQGN5uCgb9I9I7mv8cCiPNh48hyxyTJ23hwcyz8Nk2MVsnyEXwm4XIMoDNFA3TQvNWvSBCns29etEMUhHy+tHNEcq2NQFPUdHXmY513wZzQk9lbTvh7GXaez//bC7EKtVWBBN2Pv22m6IoHx19XI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716475226; c=relaxed/simple;
	bh=/EhI5SV+eLkKHn6JuRJDB8qmUsH9QFiZWAcZwM5kl8w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=lqa9PUBEzlNPD7lkbPmApULUybPSo26hwXT+DUuEK1tRc7GS9COSMdVDq9StLC29Z82onPpj9zYdskORbOuDlKggSMNOD5HmgElMBIGui1OnFwbnkCs2+3lDwbFKPataEtnw7G6GLGiaPqjEtNBziEfMj33qD+wPFyYTR4Pz/bQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qV6GPmFV; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qV6GPmFV"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4200ee47de7so54597505e9.2
        for <oe-kbuild-all@lists.linux.dev>; Thu, 23 May 2024 07:40:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716475221; x=1717080021; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ntcN9UG8LCLRsIiP82LMaVuIkwbqeFlgR40LbwJ887I=;
        b=qV6GPmFVVgTFmEUZ9Ljw/GAYHTOLkodzOj2rE/fivSqhUwPfLkKlZfC1YZ26WGhD2f
         4RjESp198PZ5CiN3L4pMMmqFWCFKFc8nEpyMD3gR95zqfb11ZwdL1dtjqZSq0DiAMTSU
         87IqzI3x9NX0fQFd667wDAvCwDv/wKPfVs4Cp3dUF4bBAXvpxBvkGQBJxr8D+qgL3FZU
         oukTEYmF08OM33pcfdQAErbY6S0jkt0oV6tfsVGd7GgmpwKE6aaq0KoNs8mUcTYCT8Vl
         fUI+jgMXnHFAwD/wWdb21lPTfP4eFGLVW8z5u0hr65NaFNGulT2dSQc0YvNQmSVYcpyS
         tzYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716475221; x=1717080021;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ntcN9UG8LCLRsIiP82LMaVuIkwbqeFlgR40LbwJ887I=;
        b=rYlN6HmNGaOesksk4nyLxqwWiMZ/t3k8rcKTHCExcZMohVptfcWuOBvwQKFDPgWHAW
         2DQwzWPZQ4OrHBQRjj5cLelrgVBuI9g4CCQcHeHTzBMitATKQ9X2Lp2pIxSpF2iVVDLV
         GMUL9wAfzpT04HMUR4zMspUnF73X3jb1wzKEqMUBQNdG3XuKB/S4M1KG8B0yiFQRF6WC
         U20QYbmkSUx4Ad7OyxhjNNObjQSpuxxDnu6PaCv3+suMC16cRJl+0F8H7g5H+buOaMV1
         cU6WdewzJL/qLCw+EG8ATtnvH7DyKdBba62LQV/IRsAk9vJTEYHRgwP2w/oBn6MyrjFQ
         6Ymg==
X-Forwarded-Encrypted: i=1; AJvYcCUXDfwU+2mYBW8avbpMhZai/QzCxIx725RxmKFXWJJucPboojlXMFvHzDrM/2r5Rz3DGel7NZKv2nk12ksll1rsaODT777zx4GsrKB9ZA==
X-Gm-Message-State: AOJu0Yxtv9Hjwqe2lOLkpZzD1KFD6xYFbBfKbiQXQ07fP8SDpLle13cQ
	E4lsHkvzp8j9VE0f4gGrFd4q3iskrK2ICLIqQ8Pp3c6OrqztRuxejeCLi5UgxqM=
X-Google-Smtp-Source: AGHT+IElJxY9dqC1eLWDsF5oZGyvKHUVkCA4vyOJY3Vj6h3bD/viIGXHTHOqCpe+gJLvs8lAkOFo3w==
X-Received: by 2002:a7b:cb44:0:b0:41a:1d3a:3fc1 with SMTP id 5b1f17b1804b1-420fd2d8443mr40254095e9.3.1716475221044;
        Thu, 23 May 2024 07:40:21 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42100fb2205sm27214235e9.42.2024.05.23.07.40.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 May 2024 07:40:19 -0700 (PDT)
Date: Thu, 23 May 2024 17:40:16 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	Harshad Shirwadkar <harshadshirwadkar@gmail.com>,
	linux-ext4@vger.kernel.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, tytso@mit.edu,
	saukad@google.com, harshads@google.com,
	Harshad Shirwadkar <harshadshirwadkar@gmail.com>
Subject: Re: [PATCH 09/10] ext4: temporarily elevate commit thread priority
Message-ID: <00111762-dd9a-4274-8893-770d1f92d1ff@moroto.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240520055153.136091-10-harshadshirwadkar@gmail.com>

Hi Harshad,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Harshad-Shirwadkar/ext4-convert-i_fc_lock-to-spinlock/20240520-135501
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tytso/ext4.git dev
patch link:    https://lore.kernel.org/r/20240520055153.136091-10-harshadshirwadkar%40gmail.com
patch subject: [PATCH 09/10] ext4: temporarily elevate commit thread priority
config: i386-randconfig-141-20240520 (https://download.01.org/0day-ci/archive/20240521/202405210026.5LpHV4Sn-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202405210026.5LpHV4Sn-lkp@intel.com/

smatch warnings:
fs/ext4/fast_commit.c:1280 ext4_fc_commit() error: uninitialized symbol 'old_ioprio'.

vim +/old_ioprio +1280 fs/ext4/fast_commit.c

aa75f4d3daaeb1 Harshad Shirwadkar 2020-10-15  1200  int ext4_fc_commit(journal_t *journal, tid_t commit_tid)
aa75f4d3daaeb1 Harshad Shirwadkar 2020-10-15  1201  {
c30365b90ab26f Yu Zhe             2022-04-01  1202  	struct super_block *sb = journal->j_private;
aa75f4d3daaeb1 Harshad Shirwadkar 2020-10-15  1203  	struct ext4_sb_info *sbi = EXT4_SB(sb);
aa75f4d3daaeb1 Harshad Shirwadkar 2020-10-15  1204  	int nblks = 0, ret, bsize = journal->j_blocksize;
aa75f4d3daaeb1 Harshad Shirwadkar 2020-10-15  1205  	int subtid = atomic_read(&sbi->s_fc_subtid);
0915e464cb2746 Harshad Shirwadkar 2021-12-23  1206  	int status = EXT4_FC_STATUS_OK, fc_bufs_before = 0;
aa75f4d3daaeb1 Harshad Shirwadkar 2020-10-15  1207  	ktime_t start_time, commit_time;
c3b2c196d67585 Harshad Shirwadkar 2024-05-20  1208  	int old_ioprio, journal_ioprio;
aa75f4d3daaeb1 Harshad Shirwadkar 2020-10-15  1209  
7f142440847480 Ritesh Harjani     2022-03-12  1210  	if (!test_opt2(sb, JOURNAL_FAST_COMMIT))
7f142440847480 Ritesh Harjani     2022-03-12  1211  		return jbd2_complete_transaction(journal, commit_tid);
7f142440847480 Ritesh Harjani     2022-03-12  1212  
5641ace54471cb Ritesh Harjani     2022-03-12  1213  	trace_ext4_fc_commit_start(sb, commit_tid);
aa75f4d3daaeb1 Harshad Shirwadkar 2020-10-15  1214  
aa75f4d3daaeb1 Harshad Shirwadkar 2020-10-15  1215  	start_time = ktime_get();
aa75f4d3daaeb1 Harshad Shirwadkar 2020-10-15  1216  
aa75f4d3daaeb1 Harshad Shirwadkar 2020-10-15  1217  restart_fc:
aa75f4d3daaeb1 Harshad Shirwadkar 2020-10-15  1218  	ret = jbd2_fc_begin_commit(journal, commit_tid);
aa75f4d3daaeb1 Harshad Shirwadkar 2020-10-15  1219  	if (ret == -EALREADY) {
aa75f4d3daaeb1 Harshad Shirwadkar 2020-10-15  1220  		/* There was an ongoing commit, check if we need to restart */
aa75f4d3daaeb1 Harshad Shirwadkar 2020-10-15  1221  		if (atomic_read(&sbi->s_fc_subtid) <= subtid &&
aa75f4d3daaeb1 Harshad Shirwadkar 2020-10-15  1222  			commit_tid > journal->j_commit_sequence)
aa75f4d3daaeb1 Harshad Shirwadkar 2020-10-15  1223  			goto restart_fc;
d9bf099cb980d6 Ritesh Harjani     2022-03-12  1224  		ext4_fc_update_stats(sb, EXT4_FC_STATUS_SKIPPED, 0, 0,
d9bf099cb980d6 Ritesh Harjani     2022-03-12  1225  				commit_tid);
0915e464cb2746 Harshad Shirwadkar 2021-12-23  1226  		return 0;
aa75f4d3daaeb1 Harshad Shirwadkar 2020-10-15  1227  	} else if (ret) {
0915e464cb2746 Harshad Shirwadkar 2021-12-23  1228  		/*
0915e464cb2746 Harshad Shirwadkar 2021-12-23  1229  		 * Commit couldn't start. Just update stats and perform a
0915e464cb2746 Harshad Shirwadkar 2021-12-23  1230  		 * full commit.
0915e464cb2746 Harshad Shirwadkar 2021-12-23  1231  		 */
d9bf099cb980d6 Ritesh Harjani     2022-03-12  1232  		ext4_fc_update_stats(sb, EXT4_FC_STATUS_FAILED, 0, 0,
d9bf099cb980d6 Ritesh Harjani     2022-03-12  1233  				commit_tid);
0915e464cb2746 Harshad Shirwadkar 2021-12-23  1234  		return jbd2_complete_transaction(journal, commit_tid);
aa75f4d3daaeb1 Harshad Shirwadkar 2020-10-15  1235  	}
0915e464cb2746 Harshad Shirwadkar 2021-12-23  1236  
7bbbe241ec7ce0 Harshad Shirwadkar 2021-12-23  1237  	/*
7bbbe241ec7ce0 Harshad Shirwadkar 2021-12-23  1238  	 * After establishing journal barrier via jbd2_fc_begin_commit(), check
7bbbe241ec7ce0 Harshad Shirwadkar 2021-12-23  1239  	 * if we are fast commit ineligible.
7bbbe241ec7ce0 Harshad Shirwadkar 2021-12-23  1240  	 */
7bbbe241ec7ce0 Harshad Shirwadkar 2021-12-23  1241  	if (ext4_test_mount_flag(sb, EXT4_MF_FC_INELIGIBLE)) {
0915e464cb2746 Harshad Shirwadkar 2021-12-23  1242  		status = EXT4_FC_STATUS_INELIGIBLE;
0915e464cb2746 Harshad Shirwadkar 2021-12-23  1243  		goto fallback;

old_ioprio not initialized.

7bbbe241ec7ce0 Harshad Shirwadkar 2021-12-23  1244  	}
aa75f4d3daaeb1 Harshad Shirwadkar 2020-10-15  1245  
c3b2c196d67585 Harshad Shirwadkar 2024-05-20  1246  	/*
c3b2c196d67585 Harshad Shirwadkar 2024-05-20  1247  	 * Now that we know that this thread is going to do a fast commit,
c3b2c196d67585 Harshad Shirwadkar 2024-05-20  1248  	 * elevate the priority to match that of the journal thread.
c3b2c196d67585 Harshad Shirwadkar 2024-05-20  1249  	 */
c3b2c196d67585 Harshad Shirwadkar 2024-05-20  1250  	if (journal->j_task->io_context)
c3b2c196d67585 Harshad Shirwadkar 2024-05-20  1251  		journal_ioprio = sbi->s_journal->j_task->io_context->ioprio;
c3b2c196d67585 Harshad Shirwadkar 2024-05-20  1252  	else
c3b2c196d67585 Harshad Shirwadkar 2024-05-20  1253  		journal_ioprio = EXT4_DEF_JOURNAL_IOPRIO;
c3b2c196d67585 Harshad Shirwadkar 2024-05-20  1254  	old_ioprio = get_current_ioprio();
c3b2c196d67585 Harshad Shirwadkar 2024-05-20  1255  	set_task_ioprio(current, journal_ioprio);
aa75f4d3daaeb1 Harshad Shirwadkar 2020-10-15  1256  	fc_bufs_before = (sbi->s_fc_bytes + bsize - 1) / bsize;
aa75f4d3daaeb1 Harshad Shirwadkar 2020-10-15  1257  	ret = ext4_fc_perform_commit(journal);
aa75f4d3daaeb1 Harshad Shirwadkar 2020-10-15  1258  	if (ret < 0) {
0915e464cb2746 Harshad Shirwadkar 2021-12-23  1259  		status = EXT4_FC_STATUS_FAILED;
0915e464cb2746 Harshad Shirwadkar 2021-12-23  1260  		goto fallback;
aa75f4d3daaeb1 Harshad Shirwadkar 2020-10-15  1261  	}
aa75f4d3daaeb1 Harshad Shirwadkar 2020-10-15  1262  	nblks = (sbi->s_fc_bytes + bsize - 1) / bsize - fc_bufs_before;
aa75f4d3daaeb1 Harshad Shirwadkar 2020-10-15  1263  	ret = jbd2_fc_wait_bufs(journal, nblks);
aa75f4d3daaeb1 Harshad Shirwadkar 2020-10-15  1264  	if (ret < 0) {
0915e464cb2746 Harshad Shirwadkar 2021-12-23  1265  		status = EXT4_FC_STATUS_FAILED;
0915e464cb2746 Harshad Shirwadkar 2021-12-23  1266  		goto fallback;
aa75f4d3daaeb1 Harshad Shirwadkar 2020-10-15  1267  	}
aa75f4d3daaeb1 Harshad Shirwadkar 2020-10-15  1268  	atomic_inc(&sbi->s_fc_subtid);
0915e464cb2746 Harshad Shirwadkar 2021-12-23  1269  	ret = jbd2_fc_end_commit(journal);
c3b2c196d67585 Harshad Shirwadkar 2024-05-20  1270  	set_task_ioprio(current, old_ioprio);
aa75f4d3daaeb1 Harshad Shirwadkar 2020-10-15  1271  	/*
0915e464cb2746 Harshad Shirwadkar 2021-12-23  1272  	 * weight the commit time higher than the average time so we
0915e464cb2746 Harshad Shirwadkar 2021-12-23  1273  	 * don't react too strongly to vast changes in the commit time
aa75f4d3daaeb1 Harshad Shirwadkar 2020-10-15  1274  	 */
0915e464cb2746 Harshad Shirwadkar 2021-12-23  1275  	commit_time = ktime_to_ns(ktime_sub(ktime_get(), start_time));
d9bf099cb980d6 Ritesh Harjani     2022-03-12  1276  	ext4_fc_update_stats(sb, status, commit_time, nblks, commit_tid);
0915e464cb2746 Harshad Shirwadkar 2021-12-23  1277  	return ret;
0915e464cb2746 Harshad Shirwadkar 2021-12-23  1278  
0915e464cb2746 Harshad Shirwadkar 2021-12-23  1279  fallback:
c3b2c196d67585 Harshad Shirwadkar 2024-05-20 @1280  	set_task_ioprio(current, old_ioprio);
                                                                                 ^^^^^^^^^^
Uninitialized

0915e464cb2746 Harshad Shirwadkar 2021-12-23  1281  	ret = jbd2_fc_end_commit_fallback(journal);
d9bf099cb980d6 Ritesh Harjani     2022-03-12  1282  	ext4_fc_update_stats(sb, status, 0, 0, commit_tid);
0915e464cb2746 Harshad Shirwadkar 2021-12-23  1283  	return ret;
aa75f4d3daaeb1 Harshad Shirwadkar 2020-10-15  1284  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

