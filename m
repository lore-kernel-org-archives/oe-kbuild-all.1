Content-Type: multipart/mixed; boundary="===============0604618632532660909=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH] btrfs: print message when tree-log replay starts
Date: Thu, 06 Feb 2020 14:33:29 +0800
Message-ID: <202002061426.GWoymcNg%lkp@intel.com>
In-Reply-To: <20200205161216.24260-1-dsterba@suse.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============0604618632532660909==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi David,

I love your patch! Yet something to improve:

[auto build test ERROR on kdave/for-next]
[also build test ERROR on v5.5 next-20200205]
[if your patch is applied to the wrong git tree, please drop us a note to h=
elp
improve the system. BTW, we also suggest to use '--base' option to specify =
the
base tree in git format-patch, please see https://stackoverflow.com/a/37406=
982]

url:    https://github.com/0day-ci/linux/commits/David-Sterba/btrfs-print-m=
essage-when-tree-log-replay-starts/20200206-122055
base:   https://git.kernel.org/pub/scm/linux/kernel/git/kdave/linux.git for=
-next
config: s390-randconfig-a001-20200206 (attached as .config)
compiler: s390-linux-gcc (GCC) 7.5.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # save the attached .config to linux build tree
        GCC_VERSION=3D7.5.0 make.cross ARCH=3Ds390 =


If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   fs/btrfs/disk-io.c: In function 'open_ctree':
>> fs/btrfs/disk-io.c:3167:37: error: macro "btrfs_info" requires 3 argumen=
ts, but only 1 given
      btrfs_info("start tree-log replay");
                                        ^
>> fs/btrfs/disk-io.c:3167:3: error: 'btrfs_info' undeclared (first use in =
this function); did you mean 'btrfs_ino'?
      btrfs_info("start tree-log replay");
      ^~~~~~~~~~
      btrfs_ino
   fs/btrfs/disk-io.c:3167:3: note: each undeclared identifier is reported =
only once for each function it appears in

vim +/btrfs_info +3167 fs/btrfs/disk-io.c

  2626	=

  2627	int __cold open_ctree(struct super_block *sb,
  2628		       struct btrfs_fs_devices *fs_devices,
  2629		       char *options)
  2630	{
  2631		u32 sectorsize;
  2632		u32 nodesize;
  2633		u32 stripesize;
  2634		u64 generation;
  2635		u64 features;
  2636		u16 csum_type;
  2637		struct btrfs_key location;
  2638		struct buffer_head *bh;
  2639		struct btrfs_super_block *disk_super;
  2640		struct btrfs_fs_info *fs_info =3D btrfs_sb(sb);
  2641		struct btrfs_root *tree_root;
  2642		struct btrfs_root *chunk_root;
  2643		int ret;
  2644		int err =3D -EINVAL;
  2645		int clear_free_space_tree =3D 0;
  2646		int level;
  2647	=

  2648		tree_root =3D fs_info->tree_root =3D btrfs_alloc_root(fs_info, GFP_=
KERNEL);
  2649		chunk_root =3D fs_info->chunk_root =3D btrfs_alloc_root(fs_info, GF=
P_KERNEL);
  2650		if (!tree_root || !chunk_root) {
  2651			err =3D -ENOMEM;
  2652			goto fail;
  2653		}
  2654	=

  2655		ret =3D init_srcu_struct(&fs_info->subvol_srcu);
  2656		if (ret) {
  2657			err =3D ret;
  2658			goto fail;
  2659		}
  2660	=

  2661		ret =3D percpu_counter_init(&fs_info->dio_bytes, 0, GFP_KERNEL);
  2662		if (ret) {
  2663			err =3D ret;
  2664			goto fail_srcu;
  2665		}
  2666	=

  2667		ret =3D percpu_counter_init(&fs_info->dirty_metadata_bytes, 0, GFP_=
KERNEL);
  2668		if (ret) {
  2669			err =3D ret;
  2670			goto fail_dio_bytes;
  2671		}
  2672		fs_info->dirty_metadata_batch =3D PAGE_SIZE *
  2673						(1 + ilog2(nr_cpu_ids));
  2674	=

  2675		ret =3D percpu_counter_init(&fs_info->delalloc_bytes, 0, GFP_KERNEL=
);
  2676		if (ret) {
  2677			err =3D ret;
  2678			goto fail_dirty_metadata_bytes;
  2679		}
  2680	=

  2681		ret =3D percpu_counter_init(&fs_info->dev_replace.bio_counter, 0,
  2682				GFP_KERNEL);
  2683		if (ret) {
  2684			err =3D ret;
  2685			goto fail_delalloc_bytes;
  2686		}
  2687	=

  2688		INIT_RADIX_TREE(&fs_info->fs_roots_radix, GFP_ATOMIC);
  2689		INIT_RADIX_TREE(&fs_info->buffer_radix, GFP_ATOMIC);
  2690		INIT_LIST_HEAD(&fs_info->trans_list);
  2691		INIT_LIST_HEAD(&fs_info->dead_roots);
  2692		INIT_LIST_HEAD(&fs_info->delayed_iputs);
  2693		INIT_LIST_HEAD(&fs_info->delalloc_roots);
  2694		INIT_LIST_HEAD(&fs_info->caching_block_groups);
  2695		spin_lock_init(&fs_info->delalloc_root_lock);
  2696		spin_lock_init(&fs_info->trans_lock);
  2697		spin_lock_init(&fs_info->fs_roots_radix_lock);
  2698		spin_lock_init(&fs_info->delayed_iput_lock);
  2699		spin_lock_init(&fs_info->defrag_inodes_lock);
  2700		spin_lock_init(&fs_info->super_lock);
  2701		spin_lock_init(&fs_info->buffer_lock);
  2702		spin_lock_init(&fs_info->unused_bgs_lock);
  2703		rwlock_init(&fs_info->tree_mod_log_lock);
  2704		mutex_init(&fs_info->unused_bg_unpin_mutex);
  2705		mutex_init(&fs_info->delete_unused_bgs_mutex);
  2706		mutex_init(&fs_info->reloc_mutex);
  2707		mutex_init(&fs_info->delalloc_root_mutex);
  2708		seqlock_init(&fs_info->profiles_lock);
  2709	=

  2710		INIT_LIST_HEAD(&fs_info->dirty_cowonly_roots);
  2711		INIT_LIST_HEAD(&fs_info->space_info);
  2712		INIT_LIST_HEAD(&fs_info->tree_mod_seq_list);
  2713		INIT_LIST_HEAD(&fs_info->unused_bgs);
  2714		extent_map_tree_init(&fs_info->mapping_tree);
  2715		btrfs_init_block_rsv(&fs_info->global_block_rsv,
  2716				     BTRFS_BLOCK_RSV_GLOBAL);
  2717		btrfs_init_block_rsv(&fs_info->trans_block_rsv, BTRFS_BLOCK_RSV_TRA=
NS);
  2718		btrfs_init_block_rsv(&fs_info->chunk_block_rsv, BTRFS_BLOCK_RSV_CHU=
NK);
  2719		btrfs_init_block_rsv(&fs_info->empty_block_rsv, BTRFS_BLOCK_RSV_EMP=
TY);
  2720		btrfs_init_block_rsv(&fs_info->delayed_block_rsv,
  2721				     BTRFS_BLOCK_RSV_DELOPS);
  2722		btrfs_init_block_rsv(&fs_info->delayed_refs_rsv,
  2723				     BTRFS_BLOCK_RSV_DELREFS);
  2724	=

  2725		atomic_set(&fs_info->async_delalloc_pages, 0);
  2726		atomic_set(&fs_info->defrag_running, 0);
  2727		atomic_set(&fs_info->reada_works_cnt, 0);
  2728		atomic_set(&fs_info->nr_delayed_iputs, 0);
  2729		atomic64_set(&fs_info->tree_mod_seq, 0);
  2730		fs_info->sb =3D sb;
  2731		fs_info->max_inline =3D BTRFS_DEFAULT_MAX_INLINE;
  2732		fs_info->metadata_ratio =3D 0;
  2733		fs_info->defrag_inodes =3D RB_ROOT;
  2734		atomic64_set(&fs_info->free_chunk_space, 0);
  2735		fs_info->tree_mod_log =3D RB_ROOT;
  2736		fs_info->commit_interval =3D BTRFS_DEFAULT_COMMIT_INTERVAL;
  2737		fs_info->avg_delayed_ref_runtime =3D NSEC_PER_SEC >> 6; /* div by 6=
4 */
  2738		/* readahead state */
  2739		INIT_RADIX_TREE(&fs_info->reada_tree, GFP_NOFS & ~__GFP_DIRECT_RECL=
AIM);
  2740		spin_lock_init(&fs_info->reada_lock);
  2741		btrfs_init_ref_verify(fs_info);
  2742	=

  2743		fs_info->thread_pool_size =3D min_t(unsigned long,
  2744						  num_online_cpus() + 2, 8);
  2745	=

  2746		INIT_LIST_HEAD(&fs_info->ordered_roots);
  2747		spin_lock_init(&fs_info->ordered_root_lock);
  2748	=

  2749		fs_info->btree_inode =3D new_inode(sb);
  2750		if (!fs_info->btree_inode) {
  2751			err =3D -ENOMEM;
  2752			goto fail_bio_counter;
  2753		}
  2754		mapping_set_gfp_mask(fs_info->btree_inode->i_mapping, GFP_NOFS);
  2755	=

  2756		fs_info->delayed_root =3D kmalloc(sizeof(struct btrfs_delayed_root),
  2757						GFP_KERNEL);
  2758		if (!fs_info->delayed_root) {
  2759			err =3D -ENOMEM;
  2760			goto fail_iput;
  2761		}
  2762		btrfs_init_delayed_root(fs_info->delayed_root);
  2763	=

  2764		btrfs_init_scrub(fs_info);
  2765	#ifdef CONFIG_BTRFS_FS_CHECK_INTEGRITY
  2766		fs_info->check_integrity_print_mask =3D 0;
  2767	#endif
  2768		btrfs_init_balance(fs_info);
  2769		btrfs_init_async_reclaim_work(&fs_info->async_reclaim_work);
  2770	=

  2771		sb->s_blocksize =3D BTRFS_BDEV_BLOCKSIZE;
  2772		sb->s_blocksize_bits =3D blksize_bits(BTRFS_BDEV_BLOCKSIZE);
  2773	=

  2774		btrfs_init_btree_inode(fs_info);
  2775	=

  2776		spin_lock_init(&fs_info->block_group_cache_lock);
  2777		fs_info->block_group_cache_tree =3D RB_ROOT;
  2778		fs_info->first_logical_byte =3D (u64)-1;
  2779	=

  2780		extent_io_tree_init(fs_info, &fs_info->freed_extents[0],
  2781				    IO_TREE_FS_INFO_FREED_EXTENTS0, NULL);
  2782		extent_io_tree_init(fs_info, &fs_info->freed_extents[1],
  2783				    IO_TREE_FS_INFO_FREED_EXTENTS1, NULL);
  2784		fs_info->pinned_extents =3D &fs_info->freed_extents[0];
  2785		set_bit(BTRFS_FS_BARRIER, &fs_info->flags);
  2786	=

  2787		mutex_init(&fs_info->ordered_operations_mutex);
  2788		mutex_init(&fs_info->tree_log_mutex);
  2789		mutex_init(&fs_info->chunk_mutex);
  2790		mutex_init(&fs_info->transaction_kthread_mutex);
  2791		mutex_init(&fs_info->cleaner_mutex);
  2792		mutex_init(&fs_info->ro_block_group_mutex);
  2793		init_rwsem(&fs_info->commit_root_sem);
  2794		init_rwsem(&fs_info->cleanup_work_sem);
  2795		init_rwsem(&fs_info->subvol_sem);
  2796		sema_init(&fs_info->uuid_tree_rescan_sem, 1);
  2797	=

  2798		btrfs_init_dev_replace_locks(fs_info);
  2799		btrfs_init_qgroup(fs_info);
  2800		btrfs_discard_init(fs_info);
  2801	=

  2802		btrfs_init_free_cluster(&fs_info->meta_alloc_cluster);
  2803		btrfs_init_free_cluster(&fs_info->data_alloc_cluster);
  2804	=

  2805		init_waitqueue_head(&fs_info->transaction_throttle);
  2806		init_waitqueue_head(&fs_info->transaction_wait);
  2807		init_waitqueue_head(&fs_info->transaction_blocked_wait);
  2808		init_waitqueue_head(&fs_info->async_submit_wait);
  2809		init_waitqueue_head(&fs_info->delayed_iputs_wait);
  2810	=

  2811		/* Usable values until the real ones are cached from the superblock=
 */
  2812		fs_info->nodesize =3D 4096;
  2813		fs_info->sectorsize =3D 4096;
  2814		fs_info->stripesize =3D 4096;
  2815	=

  2816		spin_lock_init(&fs_info->swapfile_pins_lock);
  2817		fs_info->swapfile_pins =3D RB_ROOT;
  2818	=

  2819		fs_info->send_in_progress =3D 0;
  2820	=

  2821		ret =3D btrfs_alloc_stripe_hash_table(fs_info);
  2822		if (ret) {
  2823			err =3D ret;
  2824			goto fail_alloc;
  2825		}
  2826	=

  2827		__setup_root(tree_root, fs_info, BTRFS_ROOT_TREE_OBJECTID);
  2828	=

  2829		invalidate_bdev(fs_devices->latest_bdev);
  2830	=

  2831		/*
  2832		 * Read super block and check the signature bytes only
  2833		 */
  2834		bh =3D btrfs_read_dev_super(fs_devices->latest_bdev);
  2835		if (IS_ERR(bh)) {
  2836			err =3D PTR_ERR(bh);
  2837			goto fail_alloc;
  2838		}
  2839	=

  2840		/*
  2841		 * Verify the type first, if that or the the checksum value are
  2842		 * corrupted, we'll find out
  2843		 */
  2844		csum_type =3D btrfs_super_csum_type((struct btrfs_super_block *)bh-=
>b_data);
  2845		if (!btrfs_supported_super_csum(csum_type)) {
  2846			btrfs_err(fs_info, "unsupported checksum algorithm: %u",
  2847				  csum_type);
  2848			err =3D -EINVAL;
  2849			brelse(bh);
  2850			goto fail_alloc;
  2851		}
  2852	=

  2853		ret =3D btrfs_init_csum_hash(fs_info, csum_type);
  2854		if (ret) {
  2855			err =3D ret;
  2856			goto fail_alloc;
  2857		}
  2858	=

  2859		/*
  2860		 * We want to check superblock checksum, the type is stored inside.
  2861		 * Pass the whole disk block of size BTRFS_SUPER_INFO_SIZE (4k).
  2862		 */
  2863		if (btrfs_check_super_csum(fs_info, bh->b_data)) {
  2864			btrfs_err(fs_info, "superblock checksum mismatch");
  2865			err =3D -EINVAL;
  2866			brelse(bh);
  2867			goto fail_csum;
  2868		}
  2869	=

  2870		/*
  2871		 * super_copy is zeroed at allocation time and we never touch the
  2872		 * following bytes up to INFO_SIZE, the checksum is calculated from
  2873		 * the whole block of INFO_SIZE
  2874		 */
  2875		memcpy(fs_info->super_copy, bh->b_data, sizeof(*fs_info->super_copy=
));
  2876		brelse(bh);
  2877	=

  2878		disk_super =3D fs_info->super_copy;
  2879	=

  2880		ASSERT(!memcmp(fs_info->fs_devices->fsid, fs_info->super_copy->fsid,
  2881			       BTRFS_FSID_SIZE));
  2882	=

  2883		if (btrfs_fs_incompat(fs_info, METADATA_UUID)) {
  2884			ASSERT(!memcmp(fs_info->fs_devices->metadata_uuid,
  2885					fs_info->super_copy->metadata_uuid,
  2886					BTRFS_FSID_SIZE));
  2887		}
  2888	=

  2889		features =3D btrfs_super_flags(disk_super);
  2890		if (features & BTRFS_SUPER_FLAG_CHANGING_FSID_V2) {
  2891			features &=3D ~BTRFS_SUPER_FLAG_CHANGING_FSID_V2;
  2892			btrfs_set_super_flags(disk_super, features);
  2893			btrfs_info(fs_info,
  2894				"found metadata UUID change in progress flag, clearing");
  2895		}
  2896	=

  2897		memcpy(fs_info->super_for_commit, fs_info->super_copy,
  2898		       sizeof(*fs_info->super_for_commit));
  2899	=

  2900		ret =3D btrfs_validate_mount_super(fs_info);
  2901		if (ret) {
  2902			btrfs_err(fs_info, "superblock contains fatal errors");
  2903			err =3D -EINVAL;
  2904			goto fail_csum;
  2905		}
  2906	=

  2907		if (!btrfs_super_root(disk_super))
  2908			goto fail_csum;
  2909	=

  2910		/* check FS state, whether FS is broken. */
  2911		if (btrfs_super_flags(disk_super) & BTRFS_SUPER_FLAG_ERROR)
  2912			set_bit(BTRFS_FS_STATE_ERROR, &fs_info->fs_state);
  2913	=

  2914		/*
  2915		 * In the long term, we'll store the compression type in the super
  2916		 * block, and it'll be used for per file compression control.
  2917		 */
  2918		fs_info->compress_type =3D BTRFS_COMPRESS_ZLIB;
  2919	=

  2920		ret =3D btrfs_parse_options(fs_info, options, sb->s_flags);
  2921		if (ret) {
  2922			err =3D ret;
  2923			goto fail_csum;
  2924		}
  2925	=

  2926		features =3D btrfs_super_incompat_flags(disk_super) &
  2927			~BTRFS_FEATURE_INCOMPAT_SUPP;
  2928		if (features) {
  2929			btrfs_err(fs_info,
  2930			    "cannot mount because of unsupported optional features (%llx)",
  2931			    features);
  2932			err =3D -EINVAL;
  2933			goto fail_csum;
  2934		}
  2935	=

  2936		features =3D btrfs_super_incompat_flags(disk_super);
  2937		features |=3D BTRFS_FEATURE_INCOMPAT_MIXED_BACKREF;
  2938		if (fs_info->compress_type =3D=3D BTRFS_COMPRESS_LZO)
  2939			features |=3D BTRFS_FEATURE_INCOMPAT_COMPRESS_LZO;
  2940		else if (fs_info->compress_type =3D=3D BTRFS_COMPRESS_ZSTD)
  2941			features |=3D BTRFS_FEATURE_INCOMPAT_COMPRESS_ZSTD;
  2942	=

  2943		if (features & BTRFS_FEATURE_INCOMPAT_SKINNY_METADATA)
  2944			btrfs_info(fs_info, "has skinny extents");
  2945	=

  2946		/*
  2947		 * flag our filesystem as having big metadata blocks if
  2948		 * they are bigger than the page size
  2949		 */
  2950		if (btrfs_super_nodesize(disk_super) > PAGE_SIZE) {
  2951			if (!(features & BTRFS_FEATURE_INCOMPAT_BIG_METADATA))
  2952				btrfs_info(fs_info,
  2953					"flagging fs with big metadata feature");
  2954			features |=3D BTRFS_FEATURE_INCOMPAT_BIG_METADATA;
  2955		}
  2956	=

  2957		nodesize =3D btrfs_super_nodesize(disk_super);
  2958		sectorsize =3D btrfs_super_sectorsize(disk_super);
  2959		stripesize =3D sectorsize;
  2960		fs_info->dirty_metadata_batch =3D nodesize * (1 + ilog2(nr_cpu_ids)=
);
  2961		fs_info->delalloc_batch =3D sectorsize * 512 * (1 + ilog2(nr_cpu_id=
s));
  2962	=

  2963		/* Cache block sizes */
  2964		fs_info->nodesize =3D nodesize;
  2965		fs_info->sectorsize =3D sectorsize;
  2966		fs_info->stripesize =3D stripesize;
  2967	=

  2968		/*
  2969		 * mixed block groups end up with duplicate but slightly offset
  2970		 * extent buffers for the same range.  It leads to corruptions
  2971		 */
  2972		if ((features & BTRFS_FEATURE_INCOMPAT_MIXED_GROUPS) &&
  2973		    (sectorsize !=3D nodesize)) {
  2974			btrfs_err(fs_info,
  2975	"unequal nodesize/sectorsize (%u !=3D %u) are not allowed for mixed =
block groups",
  2976				nodesize, sectorsize);
  2977			goto fail_csum;
  2978		}
  2979	=

  2980		/*
  2981		 * Needn't use the lock because there is no other task which will
  2982		 * update the flag.
  2983		 */
  2984		btrfs_set_super_incompat_flags(disk_super, features);
  2985	=

  2986		features =3D btrfs_super_compat_ro_flags(disk_super) &
  2987			~BTRFS_FEATURE_COMPAT_RO_SUPP;
  2988		if (!sb_rdonly(sb) && features) {
  2989			btrfs_err(fs_info,
  2990		"cannot mount read-write because of unsupported optional features (=
%llx)",
  2991			       features);
  2992			err =3D -EINVAL;
  2993			goto fail_csum;
  2994		}
  2995	=

  2996		ret =3D btrfs_init_workqueues(fs_info, fs_devices);
  2997		if (ret) {
  2998			err =3D ret;
  2999			goto fail_sb_buffer;
  3000		}
  3001	=

  3002		sb->s_bdi->congested_fn =3D btrfs_congested_fn;
  3003		sb->s_bdi->congested_data =3D fs_info;
  3004		sb->s_bdi->capabilities |=3D BDI_CAP_CGROUP_WRITEBACK;
  3005		sb->s_bdi->ra_pages =3D VM_READAHEAD_PAGES;
  3006		sb->s_bdi->ra_pages *=3D btrfs_super_num_devices(disk_super);
  3007		sb->s_bdi->ra_pages =3D max(sb->s_bdi->ra_pages, SZ_4M / PAGE_SIZE);
  3008	=

  3009		sb->s_blocksize =3D sectorsize;
  3010		sb->s_blocksize_bits =3D blksize_bits(sectorsize);
  3011		memcpy(&sb->s_uuid, fs_info->fs_devices->fsid, BTRFS_FSID_SIZE);
  3012	=

  3013		mutex_lock(&fs_info->chunk_mutex);
  3014		ret =3D btrfs_read_sys_array(fs_info);
  3015		mutex_unlock(&fs_info->chunk_mutex);
  3016		if (ret) {
  3017			btrfs_err(fs_info, "failed to read the system array: %d", ret);
  3018			goto fail_sb_buffer;
  3019		}
  3020	=

  3021		generation =3D btrfs_super_chunk_root_generation(disk_super);
  3022		level =3D btrfs_super_chunk_root_level(disk_super);
  3023	=

  3024		__setup_root(chunk_root, fs_info, BTRFS_CHUNK_TREE_OBJECTID);
  3025	=

  3026		chunk_root->node =3D read_tree_block(fs_info,
  3027						   btrfs_super_chunk_root(disk_super),
  3028						   generation, level, NULL);
  3029		if (IS_ERR(chunk_root->node) ||
  3030		    !extent_buffer_uptodate(chunk_root->node)) {
  3031			btrfs_err(fs_info, "failed to read chunk root");
  3032			if (!IS_ERR(chunk_root->node))
  3033				free_extent_buffer(chunk_root->node);
  3034			chunk_root->node =3D NULL;
  3035			goto fail_tree_roots;
  3036		}
  3037		btrfs_set_root_node(&chunk_root->root_item, chunk_root->node);
  3038		chunk_root->commit_root =3D btrfs_root_node(chunk_root);
  3039	=

  3040		read_extent_buffer(chunk_root->node, fs_info->chunk_tree_uuid,
  3041		   btrfs_header_chunk_tree_uuid(chunk_root->node), BTRFS_UUID_SIZE);
  3042	=

  3043		ret =3D btrfs_read_chunk_tree(fs_info);
  3044		if (ret) {
  3045			btrfs_err(fs_info, "failed to read chunk tree: %d", ret);
  3046			goto fail_tree_roots;
  3047		}
  3048	=

  3049		/*
  3050		 * Keep the devid that is marked to be the target device for the
  3051		 * device replace procedure
  3052		 */
  3053		btrfs_free_extra_devids(fs_devices, 0);
  3054	=

  3055		if (!fs_devices->latest_bdev) {
  3056			btrfs_err(fs_info, "failed to read devices");
  3057			goto fail_tree_roots;
  3058		}
  3059	=

  3060		ret =3D init_tree_roots(fs_info);
  3061		if (ret)
  3062			goto fail_tree_roots;
  3063	=

  3064		ret =3D btrfs_verify_dev_extents(fs_info);
  3065		if (ret) {
  3066			btrfs_err(fs_info,
  3067				  "failed to verify dev extents against chunks: %d",
  3068				  ret);
  3069			goto fail_block_groups;
  3070		}
  3071		ret =3D btrfs_recover_balance(fs_info);
  3072		if (ret) {
  3073			btrfs_err(fs_info, "failed to recover balance: %d", ret);
  3074			goto fail_block_groups;
  3075		}
  3076	=

  3077		ret =3D btrfs_init_dev_stats(fs_info);
  3078		if (ret) {
  3079			btrfs_err(fs_info, "failed to init dev_stats: %d", ret);
  3080			goto fail_block_groups;
  3081		}
  3082	=

  3083		ret =3D btrfs_init_dev_replace(fs_info);
  3084		if (ret) {
  3085			btrfs_err(fs_info, "failed to init dev_replace: %d", ret);
  3086			goto fail_block_groups;
  3087		}
  3088	=

  3089		btrfs_free_extra_devids(fs_devices, 1);
  3090	=

  3091		ret =3D btrfs_sysfs_add_fsid(fs_devices);
  3092		if (ret) {
  3093			btrfs_err(fs_info, "failed to init sysfs fsid interface: %d",
  3094					ret);
  3095			goto fail_block_groups;
  3096		}
  3097	=

  3098		ret =3D btrfs_sysfs_add_mounted(fs_info);
  3099		if (ret) {
  3100			btrfs_err(fs_info, "failed to init sysfs interface: %d", ret);
  3101			goto fail_fsdev_sysfs;
  3102		}
  3103	=

  3104		ret =3D btrfs_init_space_info(fs_info);
  3105		if (ret) {
  3106			btrfs_err(fs_info, "failed to initialize space info: %d", ret);
  3107			goto fail_sysfs;
  3108		}
  3109	=

  3110		ret =3D btrfs_read_block_groups(fs_info);
  3111		if (ret) {
  3112			btrfs_err(fs_info, "failed to read block groups: %d", ret);
  3113			goto fail_sysfs;
  3114		}
  3115	=

  3116		if (!sb_rdonly(sb) && !btrfs_check_rw_degradable(fs_info, NULL)) {
  3117			btrfs_warn(fs_info,
  3118			"writable mount is not allowed due to too many missing devices");
  3119			goto fail_sysfs;
  3120		}
  3121	=

  3122		fs_info->cleaner_kthread =3D kthread_run(cleaner_kthread, tree_root,
  3123						       "btrfs-cleaner");
  3124		if (IS_ERR(fs_info->cleaner_kthread))
  3125			goto fail_sysfs;
  3126	=

  3127		fs_info->transaction_kthread =3D kthread_run(transaction_kthread,
  3128							   tree_root,
  3129							   "btrfs-transaction");
  3130		if (IS_ERR(fs_info->transaction_kthread))
  3131			goto fail_cleaner;
  3132	=

  3133		if (!btrfs_test_opt(fs_info, NOSSD) &&
  3134		    !fs_info->fs_devices->rotating) {
  3135			btrfs_set_and_info(fs_info, SSD, "enabling ssd optimizations");
  3136		}
  3137	=

  3138		/*
  3139		 * Mount does not set all options immediately, we can do it now and=
 do
  3140		 * not have to wait for transaction commit
  3141		 */
  3142		btrfs_apply_pending_changes(fs_info);
  3143	=

  3144	#ifdef CONFIG_BTRFS_FS_CHECK_INTEGRITY
  3145		if (btrfs_test_opt(fs_info, CHECK_INTEGRITY)) {
  3146			ret =3D btrfsic_mount(fs_info, fs_devices,
  3147					    btrfs_test_opt(fs_info,
  3148						CHECK_INTEGRITY_INCLUDING_EXTENT_DATA) ?
  3149					    1 : 0,
  3150					    fs_info->check_integrity_print_mask);
  3151			if (ret)
  3152				btrfs_warn(fs_info,
  3153					"failed to initialize integrity check module: %d",
  3154					ret);
  3155		}
  3156	#endif
  3157		ret =3D btrfs_read_qgroup_config(fs_info);
  3158		if (ret)
  3159			goto fail_trans_kthread;
  3160	=

  3161		if (btrfs_build_ref_tree(fs_info))
  3162			btrfs_err(fs_info, "couldn't build ref tree");
  3163	=

  3164		/* do not make disk changes in broken FS or nologreplay is given */
  3165		if (btrfs_super_log_root(disk_super) !=3D 0 &&
  3166		    !btrfs_test_opt(fs_info, NOLOGREPLAY)) {
> 3167			btrfs_info("start tree-log replay");
  3168			ret =3D btrfs_replay_log(fs_info, fs_devices);
  3169			if (ret) {
  3170				err =3D ret;
  3171				goto fail_qgroup;
  3172			}
  3173		}
  3174	=

  3175		ret =3D btrfs_find_orphan_roots(fs_info);
  3176		if (ret)
  3177			goto fail_qgroup;
  3178	=

  3179		if (!sb_rdonly(sb)) {
  3180			ret =3D btrfs_cleanup_fs_roots(fs_info);
  3181			if (ret)
  3182				goto fail_qgroup;
  3183	=

  3184			mutex_lock(&fs_info->cleaner_mutex);
  3185			ret =3D btrfs_recover_relocation(tree_root);
  3186			mutex_unlock(&fs_info->cleaner_mutex);
  3187			if (ret < 0) {
  3188				btrfs_warn(fs_info, "failed to recover relocation: %d",
  3189						ret);
  3190				err =3D -EINVAL;
  3191				goto fail_qgroup;
  3192			}
  3193		}
  3194	=

  3195		location.objectid =3D BTRFS_FS_TREE_OBJECTID;
  3196		location.type =3D BTRFS_ROOT_ITEM_KEY;
  3197		location.offset =3D 0;
  3198	=

  3199		fs_info->fs_root =3D btrfs_read_fs_root_no_name(fs_info, &location);
  3200		if (IS_ERR(fs_info->fs_root)) {
  3201			err =3D PTR_ERR(fs_info->fs_root);
  3202			btrfs_warn(fs_info, "failed to read fs tree: %d", err);
  3203			goto fail_qgroup;
  3204		}
  3205	=

  3206		if (sb_rdonly(sb))
  3207			return 0;
  3208	=

  3209		if (btrfs_test_opt(fs_info, CLEAR_CACHE) &&
  3210		    btrfs_fs_compat_ro(fs_info, FREE_SPACE_TREE)) {
  3211			clear_free_space_tree =3D 1;
  3212		} else if (btrfs_fs_compat_ro(fs_info, FREE_SPACE_TREE) &&
  3213			   !btrfs_fs_compat_ro(fs_info, FREE_SPACE_TREE_VALID)) {
  3214			btrfs_warn(fs_info, "free space tree is invalid");
  3215			clear_free_space_tree =3D 1;
  3216		}
  3217	=

  3218		if (clear_free_space_tree) {
  3219			btrfs_info(fs_info, "clearing free space tree");
  3220			ret =3D btrfs_clear_free_space_tree(fs_info);
  3221			if (ret) {
  3222				btrfs_warn(fs_info,
  3223					   "failed to clear free space tree: %d", ret);
  3224				close_ctree(fs_info);
  3225				return ret;
  3226			}
  3227		}
  3228	=

  3229		if (btrfs_test_opt(fs_info, FREE_SPACE_TREE) &&
  3230		    !btrfs_fs_compat_ro(fs_info, FREE_SPACE_TREE)) {
  3231			btrfs_info(fs_info, "creating free space tree");
  3232			ret =3D btrfs_create_free_space_tree(fs_info);
  3233			if (ret) {
  3234				btrfs_warn(fs_info,
  3235					"failed to create free space tree: %d", ret);
  3236				close_ctree(fs_info);
  3237				return ret;
  3238			}
  3239		}
  3240	=

  3241		down_read(&fs_info->cleanup_work_sem);
  3242		if ((ret =3D btrfs_orphan_cleanup(fs_info->fs_root)) ||
  3243		    (ret =3D btrfs_orphan_cleanup(fs_info->tree_root))) {
  3244			up_read(&fs_info->cleanup_work_sem);
  3245			close_ctree(fs_info);
  3246			return ret;
  3247		}
  3248		up_read(&fs_info->cleanup_work_sem);
  3249	=

  3250		ret =3D btrfs_resume_balance_async(fs_info);
  3251		if (ret) {
  3252			btrfs_warn(fs_info, "failed to resume balance: %d", ret);
  3253			close_ctree(fs_info);
  3254			return ret;
  3255		}
  3256	=

  3257		ret =3D btrfs_resume_dev_replace_async(fs_info);
  3258		if (ret) {
  3259			btrfs_warn(fs_info, "failed to resume device replace: %d", ret);
  3260			close_ctree(fs_info);
  3261			return ret;
  3262		}
  3263	=

  3264		btrfs_qgroup_rescan_resume(fs_info);
  3265		btrfs_discard_resume(fs_info);
  3266	=

  3267		if (!fs_info->uuid_root) {
  3268			btrfs_info(fs_info, "creating UUID tree");
  3269			ret =3D btrfs_create_uuid_tree(fs_info);
  3270			if (ret) {
  3271				btrfs_warn(fs_info,
  3272					"failed to create the UUID tree: %d", ret);
  3273				close_ctree(fs_info);
  3274				return ret;
  3275			}
  3276		} else if (btrfs_test_opt(fs_info, RESCAN_UUID_TREE) ||
  3277			   fs_info->generation !=3D
  3278					btrfs_super_uuid_tree_generation(disk_super)) {
  3279			btrfs_info(fs_info, "checking UUID tree");
  3280			ret =3D btrfs_check_uuid_tree(fs_info);
  3281			if (ret) {
  3282				btrfs_warn(fs_info,
  3283					"failed to check the UUID tree: %d", ret);
  3284				close_ctree(fs_info);
  3285				return ret;
  3286			}
  3287		} else {
  3288			set_bit(BTRFS_FS_UPDATE_UUID_TREE_GEN, &fs_info->flags);
  3289		}
  3290		set_bit(BTRFS_FS_OPEN, &fs_info->flags);
  3291	=

  3292		/*
  3293		 * backuproot only affect mount behavior, and if open_ctree succeed=
ed,
  3294		 * no need to keep the flag
  3295		 */
  3296		btrfs_clear_opt(fs_info->mount_opt, USEBACKUPROOT);
  3297	=

  3298		return 0;
  3299	=

  3300	fail_qgroup:
  3301		btrfs_free_qgroup_config(fs_info);
  3302	fail_trans_kthread:
  3303		kthread_stop(fs_info->transaction_kthread);
  3304		btrfs_cleanup_transaction(fs_info);
  3305		btrfs_free_fs_roots(fs_info);
  3306	fail_cleaner:
  3307		kthread_stop(fs_info->cleaner_kthread);
  3308	=

  3309		/*
  3310		 * make sure we're done with the btree inode before we stop our
  3311		 * kthreads
  3312		 */
  3313		filemap_write_and_wait(fs_info->btree_inode->i_mapping);
  3314	=

  3315	fail_sysfs:
  3316		btrfs_sysfs_remove_mounted(fs_info);
  3317	=

  3318	fail_fsdev_sysfs:
  3319		btrfs_sysfs_remove_fsid(fs_info->fs_devices);
  3320	=

  3321	fail_block_groups:
  3322		btrfs_put_block_group_cache(fs_info);
  3323	=

  3324	fail_tree_roots:
  3325		free_root_pointers(fs_info, true);
  3326		invalidate_inode_pages2(fs_info->btree_inode->i_mapping);
  3327	=

  3328	fail_sb_buffer:
  3329		btrfs_stop_all_workers(fs_info);
  3330		btrfs_free_block_groups(fs_info);
  3331	fail_csum:
  3332		btrfs_free_csum_hash(fs_info);
  3333	fail_alloc:
  3334	fail_iput:
  3335		btrfs_mapping_tree_free(&fs_info->mapping_tree);
  3336	=

  3337		iput(fs_info->btree_inode);
  3338	fail_bio_counter:
  3339		percpu_counter_destroy(&fs_info->dev_replace.bio_counter);
  3340	fail_delalloc_bytes:
  3341		percpu_counter_destroy(&fs_info->delalloc_bytes);
  3342	fail_dirty_metadata_bytes:
  3343		percpu_counter_destroy(&fs_info->dirty_metadata_bytes);
  3344	fail_dio_bytes:
  3345		percpu_counter_destroy(&fs_info->dio_bytes);
  3346	fail_srcu:
  3347		cleanup_srcu_struct(&fs_info->subvol_srcu);
  3348	fail:
  3349		btrfs_free_stripe_hash_table(fs_info);
  3350		btrfs_close_devices(fs_info->fs_devices);
  3351		return err;
  3352	}
  3353	ALLOW_ERROR_INJECTION(open_ctree, ERRNO);
  3354	=


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============0604618632532660909==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

H4sICBunO14AAy5jb25maWcAjDzbctw2su/5iinnZbe2nEiyrazOKT2AIDiDHZKgAXJG0gtqIo+d
qZUl1UhK4vP1pxvgBQBBSltbsYhuNoBGo++cn3/6eUFenh++754Pt7u7ux+Lb/v7/XH3vP+y+Hq4
2//vIhWLUtQLlvL6F0DOD/cvf//69OHiZPHpl0+/nLw/3v62WO+P9/u7BX24/3r49gJvHx7uf/r5
J/j/zzD4/REIHf9ngS+9v8P333+7vV38Y0npPxe/IRFApKLM+FJTqrnSALn80Q3Bg94wqbgoL387
+XRy0uPmpFz2oBOHxIooTVShl6IWAyEHwMucl2wE2hJZ6oJcJ0w3JS95zUnOb1jqIaZckSRnb0EW
paplQ2sh1TDK5We9FXI9jCQNz9OaF0yzq9rQVkLWA7xeSUZSWHQm4D+6JgpfNtxdmtO6Wzztn18e
BzbicjQrN5rIpc55wevLD2d4GN3CiorDNDVT9eLwtLh/eEYK3du5oCTv+PruXWxYk8ZlrdmBViSv
HfwV2TC9ZrJkuV7e8GpAdyEJQM7ioPymIHHI1c3UG2IK8DEOaEpkhmRKmZPrWeSsO8KhYO3hW7hw
960QfnUzB4VNzIM/zoHdDUVWnrKMNHmtV0LVJSnY5bt/3D/c7//5biCktiS2Z3WtNrxyLmY7gP/S
OnfZUAnFr3TxuWENi1CiUiilC1YIea1JXRO6Gqg2iuU8camRBnRPhIw5RiLpymLgMkiedzcDrtni
6eX3px9Pz/vvw81YspJJTs0tpCtXKHEkFQXhpT+meBFD0ivOJM5+7aiqlnihOGJOAkbzqIpIxdp3
+o27a01Z0iwz5Z/8/v7L4uFrsNVwTqNYNgN3AjCFa71mG1bWqmNdffi+Pz7FuFdzutaiZGolHP1U
Cr26QaVSiNJdPwxWMIdIOY0cn32Lpzlz3zGjscPmy5UGqTbbMeq03/5ouY4gSsaKqgaqZUwQO/BG
5E1ZE3ntCbEFzrxGBbzVMY1Wza/17um/i2dYzmIHS3t63j0/LXa3tw8v98+H+28DGzdcwttVowk1
NHi5HLgZAeqS1Hzj2KtEpbAKQeGWI1rtrjuE6c2HqL5AM6JqUqvYDhX3WAFi2ymO1vylUUl8AxN6
JQA75ErksDMjNYaJkjYLFRE7YLgGmLsmeARzCfIVOyFlkd3X/SF8Gzaf54PYOpCSMbBmbEmTnKva
lTV/gb1WWNs/HD2x7mVFUHd4BZacue5ALtB8ZlqteFZfnp2448ijglw58NOzQQh5Wa/B5mYsoHH6
wTJT3f6x//ICrtfi6373/HLcP5nhdicRaEfa6FTVVBV4IUqXTUF0QsDZop6c0qUUTeXspCJLZu8E
k8MoqHm6DB71Gv7xZDZft/SiompBWtFVKHc+QsXTmDS3UJm67kQ7mIFs3Jj1DsQqsEHRa9G+k7IN
p2xECt5r72KwKiaz0WBSZd6cHWXQ8jF5Bh3d45Da2QbacLAecNsdE4qnplzyaKbL2I5gpzLABSbG
cUtWW9RuzStG15UAMUTFDE6up8jNYRk3cfpcwShlCjYNCpWSOuqvSJYTx8KioAD7jYMrHVfbPJMC
qCnRSDicwQ2VaeB9wkDgdMKI72vCgOtiGrgInj9650e1qMA0QQCgMyHNmQtZwJ2JOkABtoI/PL/K
+lOun9Pw9PQ8xAEFSFmFChR0HHFF0opX+2DVpCMfPq0C1DpHQfCOb8nqAiyEbh2HuEOI/A4di2xF
SmvUPW+wt9ue/gqfdVlwN6xwNAfLM9Au0t0kAZ8pa7zJm5pdBY8g0QEz7TAtqiu6cmeohEtL8WVJ
8syRMrMHd8D4Te6AWlnN1mlS7kgNF7qRngol6YbDFloWOswBIgmRkruKdI0o14Uaj2iP//2oYQ/e
n8B3qLLxoeHxG/vubgZcUs8fNdrJjEakAVbM0tQNfw2r8SLo3r0clAw9PfHCGGOa2jxCtT9+fTh+
393f7hfsz/09OBAEjBZFFwI8vcEvmCBu12mAsC+9KWCrgkYdljfO2PtmhZ2uM3POYai8SezM3jXC
UWvz7HURZUwfQMRGap2YpIDzLkli1w5I+mgijkZwZgk2uXXdQtrG9qGDoyXcWFHEVbSHuCIyhbgh
boTVqsmynFk/wLCcgFGYoApsQe8G4h7Mm0SRwHXKeA4XJrI7o+6M7fFCAT8d0t+mwvH8biAU0L4n
AOtIUILLlBPHE8TACGxT5wk5Rw0R69qsYAzrwqrVlkHEEgF4Os0Z7G+qNtvydeVS1c4N9v2zVtqB
6YbnDhpGxQbZC9W4wPfAr3RMYkW5/txwuVZTszRwGgnzlI8iJZw5ScVWiywDl+ny5O8PJ/3/em59
uDhxeGfcAlHAyjIw2P1u3c3aHFgONw104idPneTAILgqZktGZVTHh9v909PDcfH849GGHI63675a
mA3dXJyc6IyRupHubjyMi1cx9OnJxSs4px6RXqiHVURlfljCLBjnj9yKfurIjKcX53MkGT09m4Of
xoPIDvpxZjUX57puSs85xOdOLcWDU0SY5FILnWBSCw15FMBPT2JqxYIuzkeLnWZQ+85EkG2BMfac
f0y4GywYGzDOro3GC+feltJEK5fnH3sRFHWVN0apjb3xGq4+xIrXsfzKDfDLkxsYOfsU5zCAPkwc
jaUT4+3q5vLU0QpmQSuJGSVHqbArRgMVZI2Tu7I201mKJJanBG9X+Nn9bgTVlEunH8coJbqbHgO9
zCgGaG20c6ixog7GnH4yCqzYf384/ggT+Fb5mqwgeA9gmnCCUDf34MHAu3D7UpdnbQXjNRwJf23C
mVosVeWgtqsi1VWNxtHxswXEXCZVgeZVgJMgLy8GPQAu+Opa4UpB5NXlx3PHyIMptQY1HthjjDkD
N0WY9BqiYLCiEbT2FDwm2/TwryKW4Pycuh47mkW4YllTUgyy1OXp2b8HXa/AlAZ5DLpSFEU77vRQ
2H8Ti6w3GcQGlG4vvztJXW+BZs3py/dHGHt8fDg+25xjO6skaqXTpqiim/dec5bDKOqWkRNePfy1
Py6K3f3u2/47uMKBUK54AtfPZO0wslM88RO4VRG/ByHVIRbehiFDyWqeXrab3hyOzy+7u8P/dVXF
wTusGa1BiWDCtMHam13UsmHKuQpVcDVoUQDp4UHzhm7cDZCqyjHHYuKn+EGCR6NX1xW481nsOG19
aVME+4IRTOX7VQcXkoXBUzuupWj8HHEPHQWgOEjUdUm1mwFwRzX+GyGFbjD6oFfaOGSYWPAJoJTG
FlhugPkpXMU18/KBPcbGZLPN9FyMUxuIAn6pH3z7h+otxF+VOYwGBmopvCLUBktcmLSKXTgDU1Q5
mQEzNiZgi1U2NgCfdElozHyaVXSS1wt9ILs2K7u/+/q8f3p23FO7hXLLS8w651kdkBle8Wq+u+Pt
H4fn/S0ak/df9o+ADRdr8fCIkznkrXrwUyfG0AZj5jCEjbpc1NDz/w8oGg1hIXNzJTWcEwWy18rd
gkuZZRmnHIPnpoSDXZaYHqRYpgisDcbsWFAGkdcJFiOdtUhWh8uxMhQfnUL3skxDHdHEdCsh1gEQ
wkUs5td82YjGodWFb+CTmUJWW6kP9oOWAgxkzbPrLjs5RoDwqbXCAXBLSgzyWhNXm5ScaSoIN6AK
XYi0rc+HG5ZsqTRB+UIb2fIdVF3Ihjbl46ljzKPg+7Fxkz+2NNH+xJgaE5cYNJKqskuijbYRIaYh
wmCraPSS1CvMYov2rxF37YHbUsko6WeX0sqj5awJpgOM9j3bBDEBS0Uz9tLw/Ez+3ZZ4u7aKCFKb
BXoTrshTBz/G2Na8a7jMXnjdtrqYM2ttqJCmQBpQmS1SDnIL7ADGAR4mR18ngXdm4uqV6NCiflg1
SxY5ArstkWENUtbXoSSItHOLGeWgapxsqkibnCmjWDCLjIIW2YoBmWDDS8fbIxbVddeHU+fj25Vz
6yH3mSGH4TlmnBIAgLOaKqfsgIeo+FI1sOQy/TACEOrbvvbA56EfzsDH1pHDMPvcFKSyq4ydZQ3K
rO7CK7l1EukzoPB1y+3o6x6ot7MYSrhp1ZhL1U9ioyEqr6u+8r6kYvP+993T/svivzad+3h8+Hq4
80ruiNQuP7J0A20tX5tNH7owAlhkdQbF1Htq/VH/5mUkZxbXu6gQl2FDCbgblF6++/avf/k9VNgB
Z3GUv7B+OOpyv9FP6KbCnCDWRVxjaUoICvPnQ39de5u8FJM9VxsF5oLE88MtVlPOYXT2a46CkrRv
Q5sIyztMvpwDd51ScziYVN3qgkOkUzrlVs0LkxiNvtqUoGrgkl4Xichj4gzXoeiw1n5Rp1NWpmkh
B1+kcaxq4ofdWA1FJxYU0Gc/6unqpIlaRgdti1Uwjn7/UvI6Um/FsD71h2mRmtSIsVXSh20TvyXF
DukiVjiyU2AOO1PhxHY0NjtyTlSkb/eqdsfnAwr0ov7x2HY6dNcLawwmNCTpBiuysTpzoVKhBlQn
eZRxb3iIaIMZvTMape1wzcVnzCiMxtBKmsjKJibE0JrhOPGAx4VNmqVghPwElwNcX0N4PgS43XCS
fXbX7k8yhNRdtxT4qtyvQBC/7YCo8nSYxehR21ML5hdbVOW1L6lTGDpZzSC9QuNtBPxOvEkURUZp
LxcNtdbsYizC/HJanPkFDUhDV0UE17oic3w2GG8AT655wJhcsYcyzUKDNsdCB2F+Oa+xMECaZeEW
dB2b56FFeQt8ctkOyuSqfZxpPlq8OUa6GK8s6TVWhlgjXs7e+Ncu+/Q9n73i87f79Yv9ypV97ba+
8aLO3tHp6zl7M+cv5ev3ce4qvnILX7uAb7x789du5sbNX7ZX7tkbrtjs7XrtYr16p956nfyCO6kF
Jnxk4aTHjX9uhQ+8GbEtXb9LbhXERhNAM+kEbAjgbFcQrJRUlYsxNEkaF4X9vb99ed79frc33wgt
TOuMm9BMeJkVNQbUo/A0BjILGAAmmeiW7/LMT1Tik0k39U3J+Naos7alqKjkle+OWgD49LG+dKTe
5rJ6f2lqx24Fb6htjFOwfakuTFrYuhsGIax0i7xD5e8KS3IsBtrAfzCcD4uDI4zxpNZHLUXK9Awc
i3YReEZUrZduWGIOcM1Y1b/ryKzdotvq7UNGhUl/vN2OF276CJ0QCHPP4rFcUN+MZfBtcbO23jsW
1T96ohtkWwq+lCRMwGCGWAddOIaJJE2lrvuS/yCJool3iK6VIyrdBs1pF7w05C4/nlycD/HkXPYs
BoVlbsm1F8VH0QrboxhvwfLQTdaUEgg33NwXg4ArGDO9V0PxsiDjtucxNFpoQygsgKjL37yzdrKE
Uao3lRCxPM5N0qRDVHOjbOPgMNK1JsE5VF46tEM1qss7OCaln1c2rcqOcUi7jjlMG649qqCDMXlq
PtLwEj/YP85KuiqIXEe2Yeww3AbMWFamwTgLayyo7qua2WQpyV1dN63OOgolc1XVOkElxcqu7GB0
Yrl//uvh+N/D/TdHGXpF/2hdrim5kzXEJ6yau3s3YykncXGpo9mWq0x6NPDZVC6iNAzUlEAzQuPq
xKCoJsGaJadxGTM4VkvMEcG6mao5jSeSsOV+zWIFx7Zq3Z1pZp6/O9TTynw1EP+QgdsjdL4PsF3g
lEQ/CAVwlzoxtWi/VZxjkSHBnBbTUx8UdRNUWCTDOxR8nmDJtjikjjdQ9GgbJhMRVUqAUpXuR33m
WacrWgUT4nAiwIRMTYUIksg4HA+GV3wOuEQnhRXN1cSnFDBF3ZQ2H+18EVGCHRFrzqYFglebmk8Q
bVKHqjOeiWY0MKzAPwwEk4kTQBhTEzyziwubSlxouDQziLc5GKpp1Q375HF/k7ffYEiyfQUDoXAy
oJNF/Ori7PDnci5f2OPQJnFrTZ2t7uCX725ffj/cvvOpF+mnIDXdy93m3BfUzXl75dBLzCaEFZDs
ByWoSnQ6kV7H3Z/PHe357NmeRw7XX0PBq/OJoz+PCLt5Jy7LBqR4PUKHMX0uYydiwGUKTr1xbOvr
yo3wEDiSPhz0bkY3Eked1WC4tibBrH385loK5ign98uW5zrfTjDKQMHkx2KWASH4rgw4b4rrU8oE
f4gAS8WhJzHCATfWFBVBwRdV0JPvIttycxQKS5sGgi5KKZ1UxopOKGqZxtkNB0WjAFLHP3TIzyZm
SCRPl3ETvslJqf99cnb6OQpOGQ3aj4bZchrvJiY1yeMncXX2KU6KVEkUUK3E1PTnudhWpIxzmzGG
e/oU/5kB1KDTH2KmNPYtSloq/ERQ4K9HuE5KAodBTFkmSkxUrNyoLa8nGio3EQfHk3xerqdtQVHl
0za2VPEpVyouvoYrZqUp20Q4gPD8AwQOCjU54ASXVJdUxfSgdBvqZGa+6Hb10lXlqaH2E1EkWEke
72l2cGhOlOIxZWosKX54rK6Dxrzks/uA7YSg80gxKgMaJwNLp/bnR/y4YIHtbLY+73GhWtdLFhdL
Y7mlANspIIAKvytqY5cR+QDgxiMORyZuAsmAB3JKj2R6TYsI6yb4gS6yDAvnW16Qqyh5ma15tNcA
+XBR+Xy+qIYiosewi8gnxc62edyfoKxawbHFtUqZxflRKTAMYRO867VmMbvnWLtgxP+ENcVOTD+P
AGIMK/U+mzS3EPM3hfJcx4zwXGx8y2M7qvd/Hm73i/R4+NOrttoGN7dWGz60P+ERfNTIGSZv403e
CCWqKjwyZiT2gV4Pq8SWSUxXx7nuoWH2+E3I8a+TPURd1THpxq0XKuDF6GdNXEozEohQVTcT5guA
XMQtA8JAwU3DSKDWBgXeJg0Ba9z5DmO3D/fPx4c7/F2EL71UeLSzGv57OvH5CyKYtuG2NXSavVf4
aeNVRCKfDt/ut7vj3iyHPsAfatzyb0ikW13lxP6Wz+RqwGUTZVRZzk1l59p92eMXsQDdO4x5in2D
YBZEScpApqZW1f1IyKtk+xaL+IH0h8Xuvzw+HO7DhWC3tvmsMDq992JP6umvw/PtH284frVtDX3N
4p8Uz1NziVEi40IqScVT33wPnd+H21ZfLURYZmhsF92K5V75xhvWmF5xfh4BfJG6qLLgA2o7Bra2
CbnYWzlSpiQXEwl3iFXNnBmXxZZI29CdjjaUHY7f/0IBvHsAoTgOO8m2po/MM6DdkEmXpviDJ06N
6KqWpJ/N2d7wlmlVDlkTBYO9yPPE65Ec8LqeMTdlGm6je8u06mL7lFNT6twH01YWhwWjzrFgP1Qq
+WYiiGoR2EZOBKEWAZvzWzJ6XA8ZzrDQn4XS6wZ/TG7ip+IMKftpR0vQ9NsPKfP+Z6awC7iphQX/
iIE3TQ4PJAHFWHO3C1GypVeFss+6KNzvUbBHX62ItJKRuYeMoMwopq411++RHN8oI5zJy9Pii3EQ
vB/OcYcdn0mA00IDv7TbZOl+44BPEHJLTLt/9wYL/D2fDjBk+w0+l1kLm5hAN8nViGxRp96DOS/V
fVo1dLA97o5Pga5DbCJ/M71vMXcG4U4LoKHqgEQWG4XTwZzrHCjl0vDxum12fH86ScB8SGI+v/R/
u2+MiBURLIjEFfaIDYYPzRN+sPaAPXL21yDq4+7+6c58yrPIdz/89jyYMsnXcPWUe3Z2WEx8vNhD
tRQRDme1JwclPE/k5gJIH0KkLY1OZ6sspS5JVegpouYMRTV18n1HJFw3G9R2EZ4kxa9SFL9md7sn
sIB/HB5jltRITxZ34BD2H5YyanTFxAJQASQE4vstT+uVPnUqs2Po2Sz0ow+FZWl+GhkLqMBGAwkW
RXj2JMG6flTqZvhkuwp2j48YrraD2HJgsXa3+EHxiJkCo6+rrjQ50dKMJ4df4pJ4qgvhWPnK9QY/
CYkbGUMEHDzYQHRjry28/wruPbpHu8P9/ssCaP4/Z0+2HDeO5Pt8RT1tuCOmd1RVKqn0CIJHwcVL
BFmHXhgaS24r2ra8shwz8/ebCfAAwASrdx98VGbiIM7MRB7dmepbLGXGN5ult0MynXTH+uY5LPyZ
Q6sdusIeTnj1l59//l58/53j101ESauSsODJmhyuyyNhrrEcfbiUNYyz0mAnIs6zW1SxiHPkXncM
Ls48sdcuQQCnA3dX/FER+osGY2CO6vFf/4Dz9BG4368L1bXPeqWPDL87SKomkCBYKlz5bErHWeyx
9egpspNH/hooktKjIxsocKGjqHypL0rumSyQ7OXnJ/uOUOT4F0YV/UZUBcxQQasexxEScl/k6EY8
aTAtw7Ba/Jf+dwWiSLb4pp/zPdtKF6DW5eWqzO9qAmGvCgC0x1S5TMldkYaWuUpPEERBpx4c4x72
OLQy0lyf1WFEJWkTBf7loWqevXR3Z+DyaS1NWBuLvrDeUoClQVbYwwkDNobFUls+igDcF8FHC9C5
clowNOixHGEBZtkQwm/L6qKIe4W6BUMll46XN3LxrEKdFNHjzrfDskfq3D3yJk3xB1GKh1Uxid2I
ZVADICUep6Jcr060WvPBd9L2tTRZRKmdenQKPImhfjagyjBKR2TdunjlLlaost+mTYZVQIvhw2hc
wMv9BfxpO/NJyEdMvgiA3ccsbyicihhobik1Lag/5+HBDEFugjvBSI4DZKOPvYbVfI1Sa6qNbJMM
fYf/A6PA//Pr66c/p5e30+dTqdkl46FISnqBhUxa3Dz+7v3vaKEWCSK+J8NdIy4O2Hg4KYiyLbBB
kW3UovXp7h6YTO2lpVPJ01THlx+yyFDq9fw9QCdX+7AEsQjxGIBlBqMZS/uPmN0xI+PNKWTMArhs
LHFFw8lgzYipWZXAIfSNALbu5jJxnhcDk6R2n377dxtzqIY71RLL+0lssuyMh6bnLZTltSfEXS3i
TA08iYWLPS1kU0UoXB8E92hWdmUrUpqZkL4zz1RVThQs47uvUhS3MoxdhWNfzaFkuYfV4Sv38NcW
3BFsqMzQ4/Yfq+Dt3ZqfbsxgNA69UX9wu7yaDJ6OIv7878efC/H95/vbr28qpOLPL49vwOK+oxyN
9Sy+Asu7eIIJffmB/zWns8aXAXJJ/D/qVRWzr+/Pb4+LuEzY4nOvsHt6/dd3VNotvilBf/Hh7fl/
fr28gcQvVvy3PoeF+P4OTCxc2sAPvT1/VdkxJmN3gDsIeApzEwCI/IS5+gzFT5Qf76ldH/FdYTGP
aPPCUo5xZ31sM5JUtTx5KXYMRGLWMkH22Np1+vTHB+vu2J+MhXJKzQpDUqiYCDHWf2WofVT8FeuX
HZhRQTCAtrZfHZvt2tMhtT7ARP/598X744/nvy94+Dss1N+mF5AMzRHju0pDZ/gi2LfUSSyr9gCb
llT0DdUal8sAA9HI/laO6UGYjmBpwtMiSSw7YAWVHC0lutg941DU/aL/6Yy+LMUw3uNRhJiYawR9
WCGFUH9PiKzqMZMKWT1iUhHAP/4GZFVSfehFYufDnMJpcVSxIf3Vhzt/vc6StXgdeuuQ5n/62uJO
0OuaZ63wyx6IRjZGUOo+RJbdlrBK4MvEiiiAVy6+Uoz38qgSVMOg4WRP4gbNtSdnNtr+LJbru+vF
hxhOwSP8+Y167YtFFR2F58bskW1eSFrjOtuM8ZivA607D/zumAdFHvoM0hRTQF/r9yq6lOchJZ/h
WpBbiXz6IsbRJoxW05Ze1OHkw+D7iOd5JqkpM1vogVQhFM0O40lTpKQTR5Nby63J24MaZBX1ysNw
HyKPgXbHNPuszvLUw45Cg4fKkrVZ5ZrO9fOGEX4sUViVVidyu+a2aFqfy13hb1IXYiEra3vIOhA+
claxs8yJCpLIXpFRvVwvfWbffaGUcXQI5BbXLlPBC0kdulbROrITrTAe+RhAJK5YW5PW8malGXsw
nZkslCWPwc/tcrl0RUKDq4Wya+rAMuuE7ZfXgtENVpyG49wX0hZQU58dZUprixFBL2vE+Abx0mw2
VVFZbk0a0ubBdktGQzUKB1XBQmflBte09WXAMzwS6P0V5Cd6MLhvddQiKXI6ci1WRutw5FnWUebK
FWZBauPaH4waU+t7czZfplOxkuuCs4No7I2/a3J8rIfvbkvayM0kOVwmCRJ6MEyaykOj+9eWHgPj
VNw3rrnHBOn0kRiEXZRK2wKwA7U1vRMGNL0ABjS9Ekf0xZ4BN2L1yz2siCIYLi+3NlQSZSIXw/lP
X/f0nWFUHE7uRrjzUjLHm1kKLYktnVS6ojk8CavBk/TDqC/KmjSyYmAF0epi36OHLnToOJAK0uYl
uunmcA9laHPjng/TmpKiSOyorQnpE2sU2TXsGAly+4ntanM60Sh8TLR6vCRPQwRfuXRX9DEtEtpe
EOCefSxOviKA8DSCGF91176eAcJXxmNpGWfLK3oliYQ+sj/SisBxzDNWgXBkjXp2yHzni9x7fBvk
/nzhDs+gFZYX1jrO0tN167HgBtzGr2cDrDzOouPjhf4IXtmrbS+322v6SkTUZgnV0mLkXj5A0Ym2
hG60cPclDMvt9foCz6BKyiijN1V2rqwUbPh7eeWZqzhiaX6huZzVXWPj6adBNK8ut+vt6gLnAv/F
/H4WLypXnpV2OCUXVi78tyryIrMTAsYXDufc/ibRnpTb+v/hONzqDBXGrbDaX575/AD3snVFqfh3
ocMXTwsWe6vHQF9cuA61vzR8SSJy24FgB3w7rD5ywM8R2hjG4oL8U0a5xKiXlsNZcfGKvk+LRFiX
6X3K1ifPu9996uVBoc5TlLc+9D3pfml2pEHVZ2bxf/ec3cIF0jbMw6TeQwm4hhndZpVdXDNVaH17
dXN1fWGzVBHKYhYbsV2u7zw+b4iqC3onVdvlDZX+w2oMFgqT5NFSoddURaIky4CDsTMY4U3oCntE
ycgMHGwiihSEaPhjZ4fzaFcAjta3/JLQLkXK7GOH362u1stLpazNAz99GUYAtby7MKEyk9YaiErB
fX4BSHu3XHoEKkReXzpsZcHR3u5Eqz5kre4T6/PqDBb4X5i6xs7aysrynEWepEy4PCJa+cXRmSz3
XCeiudCJc16U0g5IEh55e0oT2uXVKFtHu6a2zlQNuVDKLiFaXgIDgn6u0qNbrh0t3bTOg30hwM+2
2vmC0iD2gOlDRE1FeDCqPYoHJ2CDhrTHjW/BDQTrS+oH/b5oVt69OLKT8B+RcRh63pFEWXreoFCM
1SpdWnG0O/uczsrSk0AyJYygtF3C984V0GeZkHLjJYrX3DDmhMHpwmmMGzShITpusVERPyr3SvPx
dLY/qse715/vv/98eXpeNDIYXrfwu56fn56flAklYnr3Rvb0+OP9+c3QzOtX3e8qQtXxBZ0KP0xd
Hn9bvL/CMD0v3r/0VIRZ2NGnpM5OqNjz3eFo+izog0Fp0wkXvB59sO5u+NmWjt1F9wr749e798lR
5GVjxtXBn20ahcYsa1gcY4igFM2tzBcThUNXV9qBV+N1LKq95Y2gMRmrK3HqMIP9+FfM9/OCOQQ/
Pzr2Cl2xAmMAz7T4sTijjZbzDdFBG245QJ1bzhgsn3+jLrCPzkHBzDSqPaRl9T6wtL4DJt3vPTYv
A4nXrNKiUIPtcSMfCPWwztPk0bF2XdxcGnQlR9mSfpMcyGRdHNmR0U9GI1WTXxyDAlYCrTgbSE61
U8t0ZRj2t/izLc3w8QOoZWkpKXhwDikwcu7wb1lSSLiIWYkBiSgkP5e2neKIUuGrlCmLJbYO+Agu
T3zuID7YaDxChZEdu39ooGj4bm/GzhpxMWZl6B5TLGTnEDPpESb5iVSN9FWliAKebe5uydR2Cn+Q
IO4wZpliKITfrlh3qh/iFg/1mZ0vu+xoo/Kng7Ug3sIs0gqigWZNra4RHVovzQOcF0FFv4QPJEns
UX+OFBWpU7XwbVaO59qIaQQcC1lREzgVlYuZqU8GlBRhhAl07AATA7rOQoqJHGtWsjtZVKPa1ZpW
JA10R0zY6/GZGIgyliit2VxfVHz5ogqIAVCoAMPxUz2VmGCDvGLHcTiKEH4QA/iwi/Jdw4hG8Qpy
PBEH3Kn0xBoaKMpTNTvysRTsxkpoq5e/irFDC+8dAe5eyasookazO0SF5O41ycLb5fVp2mC0Pl21
QVPXpOzZ1SczYNthf9RF5d7J6k4Loqi0l6CBDCNehL74NyOZamCGiNVCuW3WEb0ih8sdVkveUc4Q
qsgBmS9KnaY5gzgoco+iWlHwjE5JqrFNz51R31sVNavOaGjpjo4zb6d0TU0cz9iaTjlZZeJ6YlKr
gPEVzchq5JJ+MOuQ9Khr5JqWxjokdZVo1GbTM267x7cnZZqICQBdwy7UtloiPgLwb+9rrKYoOV74
ROsaDWKXxVloaMWO07Y6e4K52gCHJsmWYZguW/HZgqxU3ZiU09wiWbDph6T7nbAs6hIyD5X0sDaX
mw1liT8QpNeW420PjrJmebWn18RAFGfbK4ekk/+oGR0tQQmZRosJXx7fHj+hlDcaO3dt1rXl4XHw
RdK827ZlfTa4NZ2+zgvsPA5Wmxt7BhjmWs21x78nYkFePBS+l4Q2kR7Da5VCW0e3Iz6hy7CNT6+j
aI6OKfj9xjylKuYbOpe7iWU6ApCVrNDL8HuvAZ0v4tvL41dDFNZG+q/ff99iAtyfGq1EcsIUrhsg
1DSnwnOIdjQfPePQoaWIhcfWq6fgPD95NCGaotueH2uWeHXfNuklsk4ZVMqLlKzy6HQ1uirpg7ND
xzJt0/JSG4pK5HEanS6RclSWqgAMIhEc1gbt5+bM/t/sSlS6HNuoG1Yfxp7Ja8p5ZXfoAyGMyw1h
drjWzk6Oa7M860YrM9HuYKOl5JbYHYl0yANQBeirVFLaubJ9rKhvVBWYi5IcVZSYYBipmlXITeej
MemvgqNHPJ4ofUssT3RSX9VZ23gW/pRUA1BJd6gbCr5PzgE5VfHV+Xp1a+Se17+749OGxfYUayD3
m00CwXJj17LcGBPawTk/UrMseVpiN+jli8hDvVpdeUl2Ga4ySmmkChexkdxJJRetWRn1UR/06KG5
/OJLfzNNDfj7Ui2wXCdD7znCN3dXI/yQgThahZUJ4YZ+AX+pcN3acW2Uo/NKhe23Zehc5UqgGWXV
g0PWUNsDzqr0HDTWI0IPU/6JM2V6Z88+SNHk+jW4uW63VY1U6Q3JLWGQYCCKIZqN1s6tOHWXIJg6
o0xyg3rtOW89+ndZZtSTyM6M5gU/WqWdgjN2SEkFQMdtewR/fUEXHPMjsAq+Y/TslXZECR2GpC6h
HvQipOJK1WW73Gy3mEaRT3XCncq7ezpAbas3YKmh+358elIBP+DcVw3//G8zwMu0P0Z3RM7riozB
AkyqlVWtAyhHZvTO6zydN8tVT1HEish68lIBerz6I8UJy7OMp6PYhW3/9vjjx/PTQtVAKPdVBbew
pVX0HH8bmjnw4wmPd5sgPPrCkip0XOM/V0v6rlEkfWigWRd8TVnND9guPdJcq8JmwfZG3tI6Zj3e
LGObcAVzXwTNDJko5io5S+5RUiv8NBycMyFZ2MauttKO2E9NvV4acaihz//+AVukXxJ96Sl2iIpG
lDI7FdRbj72HFtkwgh8++i1vZokiTbWi9eVaRxByuGFP5OcTHf2bNcFwcDSW+upI2QnoCIrsYGa9
UyBMzmLHZhzB/q3qEuF/ax/LahKnNV/dbWhe2aT7q/XNrLwpmQYVMWXSW0UqolJWhGayGV3Mxplv
eVFmIr3jjnmP0vN0lDV8GkOSIlLuzrYZgOz0W+TnB6yGUw4ql6vbLX0SWSS0BqAnCe5Xt475U88F
7tARCy0zT9u7KyPPb49wb4Eentbrmw21VidfqgDd7UFGBskf3+FEoK4EGQF/WsmWyfWtx3hloCgj
z4NdTyI2eziq6IO/p4lvl9urDW0na9JsVzH9wtET6ZvE81w99Kje3s4SwKws7+ZJSr69Xd/MDw7S
XK/m68lr3qL9Osbp97wUDKS8vrnZ0kpKk+b2lo4KPtCUPLv1HNI9jdzVy/lapJCbzd0Fmkzy69uM
3iQ2UbC+MOCS7zY3FwZT0azpm6WnOQh2s72h+ZiBpl6uPArfkWS7Ws+THLdr6PBuflVromhHna5q
XZip5TuAkSJmiotAhAY+CdV33bkNZ0DKzm0mx4TNPXF/aDhgO8hND0UJTOU6qitRekLsd6R9youk
QIfqqGyPnoRRBH3MRKXDNlKdMClVfE71/jVT9eUq/2onkS5geaL+8lU026cwOsRVdG9M7KQO9ANR
ScRmx9fLqd8XlRjqJ3pwZBiPvjA8yXvIxIl2QOTFkZ2LhlIpDzRaP6XE2i75XEg0gSYXSgKD2mAx
Tpui5Zjj4/unL0+vfyzKt+f3l2/Pr7/eF8krXFrfX107pa6esoq6ZnBS/BX6jGFUsjBjrGzOs0eQ
M9ApR2dp+qDIs0ThcR4Pl9TN+nShJQYS5u3yatkeQ8/D6c366iqSgZcggyljq0kFfScFS1Ygihtj
1UsKXYr7Yaz549uTGzq55LO9hzZpm3spMdGWlCJwtGik8USAWiaKHBFTqfnX1/eXz7++f1JRPWdC
EMZoE5VFaYuqZ+6JJDNS7VIeeoLPxWjVFPqka0TvxM01TEKJAUJI9R+wERjhnNPsQVryVngMWxAn
fUYv0PRHlj+0HDh1nwEL0OyjrExpNlB9XH3ju94RTUpyBl5mG/cdrV/ewWlzNQ02Y5ZVwohl7QPQ
WgBLul5vTm0tYTP6p6W+z05bmqFA9OG03dAsUIXpAmRJeC/1MvbcMjPqiRK8EMjYIhXvX7JHAFob
Dr9TYbpNA7YzNzDYBoE+NgPCMGAAIZBvDPh4YiDmhrJcGAk+HugqZZGfaQTLzwWNgWu7JDEZnKD7
IPT08ZSV830UWjyivy/LZgqrgTx0YSjGmeKGGQbd5E6cNrtw5bQmMs9t33eyYkcfHsbAMRizviMK
K+axz8WhVWlJHjyRX7H1pKgwNcJMEyJpWO4xTanauoaiwjOGfbASa1K1KlG4M6LANSVJ43c4Ia4H
kE5ImmGAxspa8tJuADpzCopTGx48Z1gE91yfh3lyYSRvjz++vHwicyCEHiUlwNsQTgc7fpcOSgVF
iBjjJljT8XLxgf16enld8Nfy7RUj6b6+/QY/vn9++ePXm4pKbdXwlwroIPxvj9+eF//89fnz81vH
JFl3XxyQZxpZTAdOf/z059eXP768Y/hQHk5NtsfriIc6CdGcXwAum1Qku3qGtI/NfqHlIey7O4sG
V1E0+TTU706E00cyAI7rEH4MqiDca3lSG9aogNXmNN3vRpcdr3QoTaQM0Q92P54/4RM19mHyxokF
2bUyfXWqY7wic08qHJq/TgpIMiKqQjXoveZ8bJTuRW7DOMgi1dmFCfh1dlvjRZMw8o1bIIOEicin
ZdTepHkiRGvrZE+dMAFJkVcg9hmRHwdYG1tiMBaIMtmSilCFTCNux/tW0Ac6W6ue3gxOR2fFJJia
1oJABcqy0a16f6buGcQcWVoXpV3LQURHiU6ck0V2riYSp4EWKjCHVZWoJyvlI/NZKCK2Pop8R5q4
6u/LpYDNUThLJ+VKheEAo8kuSaO8OFDxsxSySES3Fwgo/ihNjqmHx0YmEQRWTQbCQ8nC1QSV3F1f
OWsFwcddFKUzyyVjieDapP+bDU/R59kFnmM46ZyvUPd7UuTugGg/cpBhvRMCbAUcS96FqeKH9mvO
gOe1sAFwH0Z7t/mS5aiBSAuPZZiiiWqWnkkPdYVG8xzu7IwOqF14/kNhkHGwEehiUOGql05dFeZZ
s2GSCf01Fky7v9pAVHqnlhWaAmMQMHcwAAjLAE5xX5RQobxHgM3y4yv6lR73Lto6g9xnGGkPIGuh
qmYyVtUfizO2ZfqtjdBJkVocCvsj4VyRUeTMTL2D/Zu5MLR06DJBDBgTOmmtwRuxLeXarukoBPLU
NvAk8szp2kNUFd23DcPXw5x9aA3vwzmEm9HDhKuBU8radudJS6auw9RVifbGZNRVPdiBGjzEwAfI
oC12XID0VtdphOFgBTOUtIjvWFHzyEEwbAxUztLKFCRo0lK0gWelIQH8N588YBr4IVP8jodO654S
Okuedn8DImUz6dhVIrz88p+fL59gnFQaFUrfkhelqvDEI0GngEOsNpeffGI33jMtOdWw0BcnEbMI
0woDLFgVMGUzCUqzjHJ9yICxUI4931yIfsDrR1A/68v3F4yv7fJ9Q5EmlyyO8BG3yUx/MVlWRZdC
Z2xHDpBJC+iDitJBn7CMSmTRt6kiJmeeHCM90Ud1MeXteutR9vSE1eaOjjTzv5U9SXPbSK/39ytc
Oc1UzRLJS5xXlQNXiWNu5mLJvrAUW3FUsS2XJNc3+X79A9Bsshe0nHfIogbYe6MBNJaFQfzxl5AB
NPPfobSjW5OpilD8CmWIHBhENHcM0BCR9NYicUIUcttQfBhkF6fTS3YQIwJrWU5get191orS5vT8
86lchrFx8vT9+rR5+fHb5HfawNXMP+m9JN/QtoEjMSe/jWT5d6v7WbqsIu7tnKD4hGHNZgP0KGsx
p0zGBAnF7jS7zeOj7k9NH8Icz4TKyahRAITRp3smJVqRY9YITgetoWF6q58sZB7BPedHXuPsySBV
vtdIULaORrwAbsxEtSbVwOarvgaUT1vM/G5eD2jUtj85iEke1z5fH75tMIw1muOBGH/yG67FYbV7
XB9+55dCaEWSKG8cvQw8WBHP2c/SGVpcQxMO4O/jlSQh85evPrdtyN5LmP8YdfuYJE4zF0ng7zzx
+Rw4IWrcLSXeWGrbl4gEP5mnKETGr/pIPIpHAZShVXWLdudAWfJITUuLUP2Vtbe9z+pZmHGBD8MF
RV8AoBZhBK3fI+MLZQIwcVMC4AvOz4gi3swR3GWzTPGuHAFKjxfUtqFx7ku1NA49oiuqOMCdHe5h
LsPcOu5K0alhLYLB2lTOI2UebJZ63PAQvdlqZYjjklEccqVKv42HhNDjgyBWinGaFTOnRdeH3h4Z
gP5zdrcBAMOIxDLf3ph0VW9T2RLtMkxqEGE4Ma3VKUlLalOuaYSUYXWDyiQtgQwCQjTGGgBabZ6L
yxHuZUFR84rltjfzO5buthUhgXkugCoAKcHBpaL5Xnwx5Tb0TQzABK6olri0iWJ6HuveDYSZF4TL
NkMI/OMjgTItBMNQ1GsiFQiQgN4TQjn+Q2pu7Te+tbaaG5codp0kmZAEMx6y6psewfK0lM1lTELZ
bHO/2+633w4n85+v692fNyePb2vgA1VV7ZAB4DiqIpHe+prI2Xh9OPvxSbxARR7/lNbU59OPl1ZP
ge1Z/Xh7xYtvv31an+xf1+v772oHHRiKZld0pLOUiELD/vKw224eVPYJmMnMEesIrpmqQD1bzcZu
S1RDG/jRx8xFtkQzREUQvldjOSvDyF6Nn8yAzS1nHhpf8EcmT6AxDFTCc92uXNH9upFVR+V435Y4
c0dybQm3+Cobw2EEMMLFc9FRJLdlp8RwPaZJuPTlPj4jVRJiwuFyfmvtmtlq/2N94J5wDMhY7TJJ
8XKHZUxi/pE9TqI0xJZdLNVVGUw/OgI/tQtebxEtY6/pYp7OXqfvxWaca/t2XrriTs2KNIyTmpeH
54u6THLWkSMgh4t6+7YzDDCkPw4HH+RaL0l9PRCp9BrosjlP8yUL5jus9vs6XYmPxcXjlYl6zrFo
1Nb8j5qyW1w+5Qo4dfJYqW0K+x6qSjawJeJZHQsqMYSQUYJw3Myrop1x0jHmmkN0w2eMK0N/Nlku
sjyun7eH9etue2+rKMTjOOZvUR2rmC9ETa/P+0dOBq9KYJMFlzpDNSwW8FcHIYrrjiWmehPDwPDB
D/NVDO6FW5C2MCeFwvsLAND63+qf+8P6+aR4OcG0n7/jNXO/+TakkB6Qveen7SMU19uA288cWHyH
99aD8zMbKp5cd9vVw/322fUdCxeG4cvy73i3Xu/vV7DXrre75NpVyXuoQnr9K1u6KrBgBLx+Wz1B
15x9Z+Hj6gUikh99sdw8bV7+tSoaKS9a690ELbs9uI8H5uKXll52qsyk9ecgaoifmiWjlBZ6O1Gy
TE0wi29X5GGUYaLVnxxSGVVI2TwtHL6GgPdi7d2oopsCRpUPGa3yYCQWyU1k9twymxwH2QfBG/oS
LTHjiKwg+vcALJnT+lIgS2WJXph5y9NTCo2hXGMEkdpfXr1aVLpqwGHMljf8VYl56Vx683KRWXcX
Jp2jDMd2ULrquo8NPdw6cLtr9ND6WOk3xv01ezIQ15py4eCDV5rqjtQChhnULNcfYa8JjEz99nVP
23ns7OBwN9dmzw+y7qrIPZzzqckEjfMyvx0sXUPexkhH+YV66iSqHO/MiIbakCRbXmbX5ouEhpYl
yyiFv8vkeKvl0uuml3mGDqyORHsqFs6Gu02vLOdFHoGYmF1csLFpEK0IorRoUMAOI01LoK/Q8Ame
68DIiRv49vqud9+2u+fVC5y35+3L5rDdcRLdMbRhm3lD5rVRQNJlIE2v1YtFPkXigg3M+zPbUk2a
+PlNmGSs9z893Y5qIxS8PZ5pI38zaz7mC8wNeI+RMG1H9yZTRdUM8801KGbXuu3ECIJD1XEcIWJQ
vim9PmAvMHxY0EcB4GCjspqDxhQHRQ8phZo+M/2OfGW0BysrRblRrUfG8sGFckfex6+6bFZJ9OCG
i+xGWEJSYpqAWyK6i3o424oMM0IpOoq25ONfUCtVNEt0MwjMvTxCXN+FsRY2TZZ1cXZk4IjgxbwI
MSC4dDZxzamU4OIs1NiL6Dis/0KaL5+Nxh2YJpnrVqLAePD/PAq4rUlxffQ7IoYNdt16YWgq/qSe
Ur+uhaHgBtUqRJOUC/zGS5PQa2Cj1h2FR1WsMqAoKYws3nCDT11yKMBOj8DOjsKuMDs3yWs8UhUl
0DnoUsxdqP8QQAl/h8Mp6mTZeYHilYXFdRS0lfH8gOUuJ1X6hvHiWsomx1MAJddt0XBvAku+Q1is
GwdgSZGnqO2ug8phxoBIC8/xErM8MhiQOKdGr4tAlDHYflMZ8ypLuLEMMBEhBnf1zJzoAadqc7Qk
B/CRNRfYrrEIKPC7UdUwvaiiuLsBlihWXvjyJO0nYNzkU2OIVIALzqF1S0x8qR3FqTEhPC3pseTm
cyOJyXOcFMJA8+rKc6WkoYZIb5Dk/wBBcfmn4cR6nE0Xv7jREvUi6ozIEmGUAERRna0E5CAsNlTH
KBahxu5Ww+A7AUwkJn43EpQAABeVjbke13nRaOsdmgWJKBAP52N3vQFvbKgv698sUW7LkhrzbjqU
cObB1yGojSP9BxH7mHc6JMyg0bwNMTJaXJu0UwOKjTr2HKPUsugYwhv9S9VlHMvQRjGpYMt0YaJt
cQ7FSxcesFJxgVlKjjbVITe5ZBtcwnLQGFhoFsFkFOWtZGGD1f13w7a9ppz37BXYYwt0yiv8N/oM
4C1oXYJJXXwGRl+bl3+KNNEDR9wBmuNctmFsHVnZD75tIZ0X9d+x1/ydN3y/hM5XtQCCL7SSGxMF
f0vFITrFlB6wdGennzh4UmCoAgyP8WGz315enn/+c/KBQ2yb+FKdibyx7uGR9eDHJESb/frtYXvy
jRvrmCl6lMWw6MrhMUZAFJEbhUpRIQ4ZrWYTDPOqg0CcT8MqUp53rqIqV5ed3FrHn01W6n2igneI
vcChm4JXpLczIAY+e0RBAorDLqhAnlD0Q4Mt3yyZYeZNMcgRLv4ZKYGUEe35HtrBqItIhMXbljbG
okLrKmaJZW/CI7DYDYuIoLugc/eHABKGoQ424Uhf/SPdcYP+iW2eaDzsfuL+Mqi8zAGqgWOv5w7g
zdJdJ6ZOXLqARXZk3ko37Dpfnh2FXrihFdOoPGYYG0PZmeI3UpIUpYygyGQM+vGYC5T0rhjAvGpG
4p39Kt48+CXMy7PpL+Hd1U3IIupoyhiPT4KkrxaihfDhYf3taXVYf7AQjZCFfTm+pTBTHFt8ow6v
dJt4IA03zkNw5FxVhWt3yPBuOuGRQEm/lN83U+P3qXYPUYlJh1WgFhIYS+qFw4dSoHeO2NEYLCF3
jBe/RJarD8Ub5uzIeyS8b6IUkYyBcIZvM4qhW2JUUNVUErhm8yeOVJsoYf2p3GttXpWB+bub6da4
faklcY3kLSrn/NIGiS5W4m8So9jIzwRFY5gFsIckFMn50yxNEGsReVdducDrj3+XJqy2RJ8zN9y6
jVWgNNzWP6FSR0rmAY5Kw5LCtR9BfKd/Rei5r1PnMftcOs6YarwIP0YiYjN5CJZcYgdconZaVNin
0098UwrKp3Ml0rMKuTz/6IRMtWOgw87fa/Ly/JM+1BFy8dEJmTghU1c3L06d35y5B3Dx/gAuLpxN
fnY0+fn0wrlMn895uw6jAtZgX0M5++we1ic+0h8igYSEO6zjze21aibTcza1mYEzMcfq1UHC5oZT
mp/okyqLp/qMyuJTc6gSwNktqvBzvr4LvnXrcEkAmwxSHc2p68vJez2cGF28KpLLrjLHS6W8khzB
aCEMHB+fPa+HB1Ha0JOLVZ43UatnNhxgVeE1yfFqb6sk1TIKScjMo0xDz3a16FTHBfeW8CTAZEah
3dckb5PGLqahJ3q+Sglr2uoqYZ1WEMMUm8OUeyBr8yQwAi/2RV2OhgJpckc+v4NFMlMHRjq6ViU/
TdkvzF/W92+7zeGnbTCNl5cqEN+imue6xeiLpF7RGMmoqhPg23JKUVIl+cwhdvU18Qyi0OxFoRsF
AF04xyhUwuHZIVH12lS0ja7p5bypEvYNhVP6yzL2Fh2q7llW7sOBnV3GFbeyAx4GEB5neI7xZuZe
FUY5TEFLBtrlLXFDgSd0FqMEZ6Jxas+iIkWleHHUOorPFgF9i+E751FauuJyy67Wmctuc0Bpiqy4
deQjlzheWXrQJsdxDTgYVLtMVB7VgMBGEYmdbIxbL/PYJUF3ujpqHCauSgvANBeLvEsdWR2G1wtm
BFItNm4/T6FQUOOXD2jv+LD9z8sfP1fPqz+etquH183LH/vVtzXUs3n4A7MKPuJx/CBO59V697J+
opDu6xcl6aO0R+uDBG9eNofN6mnzXxkxZOht0uBqB1eY60PPSYAgoB60vRyOSxYyvvg6cfW4xWaX
JNg9ojF3g0GRhkexohKPCmqOT6QYQ0zzYPfz9bA9ud/u1ifb3cn39dPrejdOh0CGIc80E0+teGqX
R17IFtqo9VWQlHP1CcEA2J+g+MIW2qhVPuPKWERbhyA77uyJhJiT212VpY19pT52yxpQQWGjirTt
9qT05Rqr34OQNHFSmfZhFya1iGZJ/jhm9bN4Mr3M2tQCYLoZttDuekn/avKrANA/nGwup6Jt5lEe
WBX2LkxC7f329Wlz/+eP9c+Te9q4jxjA5qe1X6vas9YktDdNFAQWWhSEc6awCpkqgWjdRNPz88nn
wTjo7fB9/XLY3K8O64eT6IV6ibHO/rM5fD/x9vvt/YZA4eqwsrodqNl35ZoEGbPawRz4CW/6sSzS
28npRz4c23DwZkk9mXJ+ufKsRdfJDTM7cw/I2I0cm0+m58/bB9ULUPbHtxcuiH17xhp7UwfMTowC
3ypLqwUzE0XMOeEPm5Hp15JpD7ikRaVGkZN7fC5n2D66GKGgabnVQc9MOwDnfLX/7pq+zLP7OTe8
HmX3YUzuEd+Ij8Sj2OZxvT/YjVXB6ZRZLiy2J2vJkls/9a6iqb1GotyeX6i8mXwMk9imOWz9w6yb
C5KFZzZVDM8ZepMlsH/J4pG3YpSkIguPng2EqyqQsXh6fsEVn05t7HruTayhQCFXBRSfTzgKDwDe
+VDCs9MjR7wBRsQvZlYvmlk1+cw1tyjP9RR/gl/YvH7X7JYHIlMzdUBp1/A2YRIjb/3E9QAkMKqA
E86HDVcs0M/GGpcESP2tRYm8LAKB2OOIq1c3RykqIly4+xRG9gGIxbVo0Z25d8fwSrWX1kDd7U73
ZN/+QItOMxRWpcjKbm+VI1PaRPZNB9IZO8t9+TjJYpNsn1936/1e46yHyaGnG5u63xVW7ZdnNkFK
786YJaMnKveQ8L1JUsVq9fKwfT7J356/rnfC2ciQAYatiRl8yiq3D01Y+TPpuMpA5hw5FxCO2BGE
uxkRYBX+Q5EdIzR4L2+ZqaBg3MCWH1HzG4iS1f4l5Cp3vGcYeMju29RDSBtPm6+7FUg8u+3bYfPC
3IeYL8hjThGVAz2wFgQB/d0j7fe5XTJiufcKIolzptTkQuFBA1t4vAaVe7TBHBXBcnk1ApOLOcQm
x1CONe9kbMbRjfwlizRcYOY8zzk7Jq++zbII1Uqkk0JfdfVTBVy2ftpj1a2PiPZGWu8O6HIEvPSe
gsXsN48vq8MbSLH339f3P0BMVs2berdjSkMmlGUVby3XI8Imwago9aCbUxQnJgYesw7/9+XDh1Ek
/5UOyir9JMfEv5RMMZZkKnWeEQzdcNGV1+MhkCWdDwIUEB9SsvUw9J3RBuAnwAqgZ75Cg6XLCzq6
tk2ivntJUJzkIfxVYR43Nfl8UFShusPIwAbfZ4OsXAZz8apaRRrjF4CkA1RMPcXB5ELHGNhFZXMF
XdK0rNOBZF5V5NMpq+g1UWCrRf4t/86iofCPNT2KVy08NgKygOtTVgUXGherE7TgkxIlKfEHdl1t
kmNYB1Z9fGyn7HuOeehxVJONsU9Yig4IZvkdnnvMO6pd4XeCXhmlqhmKMqK7gq1ZNUbRS9l+qAYk
RjGHv7zDYvN3t7y8sMrIu6i0cRNPXbS+0KsyrqyZt5lvATAYgV2vH/yjrllf6litcWzd7E51qFMA
PgCmLCS908LDjIDlnQO/cJQrMyEJhKp1l/sPuNKuLtJCY8DVUnzBuOQ/wAYVkK+G5Vx6VYXZXTBi
p0J66roIEq9JbqKOEEYQWvxpsXFyakmExEmNIMUEowBBXkmaf9N+EGFeGFZd012caUd7MC8kdTsh
tvnwSqPcIoukaFJliyBmoET5WX9bvT0dKN3k5vFt+7Y/eRZa4tVuvYLL5L/r/1W4pj6haJf5t7Bx
vkwuLEiNkrCAqpREBZdRhY+MnsMzSa8q4dXeOhJrFY8oXprM8gxlk0vlUQ8B6J3o8FKoZ6nYZOOs
Cfd+8RqjENSyBUHcU0/HtaK+nKWFr04C/j5GIfO091SQ1ad3XeNpVSTVNfJTnPFUViZaOkz4EYfK
jikopO0M+Ac1YHSNXo5FamwsepdYeKlyvVNRGJWFUmUNW9JwNsLnvHzmuA97lsXiOPT3FMlUUenr
bvNy+EGJRh+e1/tH+y1UpIamQHdqR/piNOHh9dXCDg8Do6TApQy5j758cmJct2hefjZMOFAoNHmw
ahgwwtvcy5LANlYCFtQvkPWMqgpQ+GxGaKoEf4CD8otajK2fQOekDELx5mn9JybzETzgnlDvRfnO
nkLRVp+B1ipDD4I2iDS/UwVal2nC8z0KUrjwqpjnaxQsv+HDyM5CHz2rkrLhxCmREQloNL5+oyvO
OIi4gsklt6svl5PPU32blkDHM1wKl/eaF1LFXs1m96Y0yugqASdDfbQoStiKSJkSdAkzvGnEYGvh
5IMW3ZnnimVqItEw0M+M90QSNYvbQNjfiVCK7An85S2ihVTpT2i4/vr2+Ijvg8nL/rB7e9ZDxFHk
bZRe1GhoSuHwSCnW7cvHfyccVp92wtiPqrHpcAW2fu31rmk472I1RssMhHJGHPTVeEEo5+uXBqx3
TBiJmt1Fk/0vWnTZsTJVbCTTqWjZYKh2xzuvqBAR6WrijZ6xmmKRswSPgGWRYJR6fVPqkC4vejc/
dxsjMkaAfqe/6NZ3BKUqQq/xLD7UwCp89Ixz2JSkrS/RuJUmONm1qnzaTSSXLouyFE6MfU4l5Ei/
xAt+W7uYmRooUthjRXkoCNSR+m5Yh3yxmSjOBj34KwdLFJLjWwInHi6Uour9CHUnfloOQROQ32Sz
NnjE0MKxuvJqNSq2AcDHH50/CgI6iQJqKYOM2o5hdUWLTnfaVS4ARE65m1KAaYq/TMyvKIrSWScu
6JLi0fHWS+q4WAzKbUtox2wrxuNt7ZQ5Rh4x9UuEf1JsX/d/nKTb+x9vr4ISz1cvj3o+N4wLi4Ye
RcGunQZHH/E2GjNSCiCTGzCMGnQNnLdwlBuv5nfm4tqRBm9wXT82BmHKBpfMwxuFuVbon3ZGJJOk
Feo8CZXJgzwapTB16ycHB34VRaWge0LrhU/MI2H/bf+6eaHM9H+cPL8d1v+u4T/rw/1ff/2lxvkt
ZMhwimvIxIkvq+KGdZIdMKgOHMMxktgAN9NES0dSg34/MZHdDJT3K1ksBBLQyGKBNm/HerWoIwev
JBBoaNYB0lBAbEeGuE5hNWx628+beCuQwVzds9jA5KMXgkOcGsfWV6UGfPn/rL+skFxxUASLU2+m
OiAi6RFBQ7QMnxWZcGHAeJDzYTMLLdmRCbwSt5yDSPwQ3MjD6gByObAh96jktbh4UhBbM1ti8bHN
5MiSSUB5ubDxBujS7egKD4qqakf3b406ODpvNhWArAHMGHB+dqLSKmh57gkAFKPLzUMgxju7BVHw
aiRufiCV04kKt9YYC6NrJt7BGAJP67R1/K57jr1ieHVdEKQdDywihuNxqJmh9/OiwZRyQpkko1Ux
o0UFah7cYhqjURtVlGKElXHxx20uRJHj0FnllXMeRwrCsZxBN7BbJM0cFRUms9aDM4qtAgj4HmCg
oG8xrR5iAo+aWxxfjM+Zt0YhDlxUOwLEMFCz1Bl9Ft0IKK3DqE9EsuW3cawOnaK0Eb72LoKrggsp
8lhYE6ZU1btboQOc8s5SRVEGpwxkJHacVntSb2o21CMq15iUmo0RO9fftfTKdTj0lSaDoyAArDGP
tlm5YADsOucL2Lx9OWdaLdan3wq1taJ1DrzvvLCXWgIGJlmfdh+oN6wWXPAUB8O02ZXlXg7U0sO3
P/FBxFqqkzhgDthPryjWlgwWorHAUL8fMZM4irkuDElG+lMmEBRB1XE03z+Vw+r3Y6/MHWSd1aGz
cpEaD2hy6SLJcoNqGtY5PoVyaS9EleLMCfnHUaU4MdwTpnr0RrCaylJBcHWe2/wiR7wTU3Ydc497
JbnaMn2fBRgsst9nsbVFag9DWbIhR6SiBHYXRqRPej9O7Z2A3DB6DE3jXOgw61reg4TFcfU6t8Qx
yySblQ26Y3JqPa9K+7fqK5WfMNpTdcfNen9Abg6FjwADf64e14rTTKtJzmP0KrMsWtJUGjBWxLbj
ouFmd+Ozyy9yefw/PjgSLMhc8ivYNJaYDjIs7iWxQqX25Iv4HHcE5xhYIpoSEdJdj6WfXoUNz9mS
2Ez2C7WR3lVHcUIF6avV0FMsni+ZcOL3j/CCPlooHoGrT4NOLIoJdENJcI9Vhk9dcJU44UIeujg7
bkBAEzSPluZJMWZQPL2IRyqODkisOii1TJ9CswGApuDe0Qjc24w8a4X9849ZFRRTRHV3V9vW4e1D
UPHo6oZjwKHYiGGkY1RooNCgevnIfLqs1giahFxIOLGZrzJjHqQ6TC8lCzWKhmTMWmnNI9r4zPGt
SeS9GA862sLAdI63katTcVJlIHFGRs19tB09QgSUKNSPl6/JJOk4jhgkXW3uzUbebOSuqHfsKitC
a+PA9RIAb3d0j5OVkePBSVZiIvRggPQk3XR54i8Oyy9KvEz+H7eAqunDJwEA
--===============0604618632532660909==--

